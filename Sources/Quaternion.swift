//
//  File.swift
//  InterdimensionalLlama
//
//  Created by Thomas Roughton on 10/01/17.
//
//

import Foundation

public typealias quat = Quaternion

public struct Quaternion : Equatable {
    public static let identity = Quaternion(0, 0, 0, 1)
    
    public var x: Float
    public var y: Float
    public var z: Float
    public var w: Float
    
    public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    public init(angle: Float, axis: Vector3f) {
        let halfAngle = angle * 0.5;
        
        let scale = sin(halfAngle)
        let w = cos(halfAngle)
        
        self = Quaternion(scale * axis.x, scale * axis.y, scale * axis.z, w);
    }
    
    public init(eulerAngles: Vector3f) {
        let (roll, pitch, yaw) = (eulerAngles.x, eulerAngles.y, eulerAngles.z)
        
        let t0 = cos(yaw * 0.5);
        let t1 = sin(yaw * 0.5);
        let t2 = cos(roll * 0.5);
        let t3 = sin(roll * 0.5);
        let t4 = cos(pitch * 0.5);
        let t5 = sin(pitch * 0.5);
        
        let w = t0 * t2 * t4 + t1 * t3 * t5;
        let x = t0 * t3 * t4 - t1 * t2 * t5;
        let y = t0 * t2 * t5 + t1 * t3 * t4;
        let z = t1 * t2 * t4 - t0 * t3 * t5;
        
        self = Quaternion(x, y, z, w)
    }
    
    
    public var eulerAngles : Vector3f {
        get {
            return Vector3f(self.roll, self.pitch, self.yaw)
        }
        set(newValue) {
            self = Quaternion(eulerAngles: newValue)
        }
    }
    
    public var roll : Float {
        let factor1 = (self.x * self.y + self.w * self.z)
        let factor2 = self.w * self.w + self.x * self.x - self.y * self.y - self.z * self.z
        let result = atan2(2 * factor1, factor2);
        return result
    }
    
    public var pitch : Float {
        let factor1 = (self.y * self.z + self.w * self.x)
        var factor2 = self.w * self.w
        factor2 -= self.x * self.x - self.y * self.y
        factor2 += self.z * self.z
        return atan2(2 * factor1, factor2);
    }
    
    public var yaw : Float {
        let factor = (self.x * self.z - self.w * self.y)
        let clamped = clamp(-2 * factor, min: -1, max: 1)
        return asin(clamped);
    }
    
    public static func *(q1: Quaternion, q2: Quaternion) -> Quaternion {
        let x =  q1.x * q2.w + q1.y * q2.z - q1.z * q2.y + q1.w * q2.x
        let y = -q1.x * q2.z + q1.y * q2.w + q1.z * q2.x + q1.w * q2.y
        let z =  q1.x * q2.y - q1.y * q2.x + q1.z * q2.w + q1.w * q2.z
        let w = -q1.x * q2.x - q1.y * q2.y - q1.z * q2.z + q1.w * q2.w
        return Quaternion(x, y, z, w)
    }
    
    @inline(__always)
    public static func *=(lhs: inout Quaternion, rhs: Quaternion) {
        lhs = lhs * rhs
    }
    
    public static func *(lhs: Quaternion, rhs: Float) -> Quaternion {
        return Quaternion(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
    }
    
    @inline(__always)
    public static func *=(lhs: inout Quaternion, rhs: Float) {
        lhs.x *= rhs
        lhs.y *= rhs
        lhs.z *= rhs
        lhs.w *= rhs
    }
    
    public static func ==(lhs: Quaternion, rhs: Quaternion) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w
    }
    
    public static func normalize(_ x: Quaternion) -> Quaternion {
        //http://stackoverflow.com/questions/11667783/quaternion-and-normalization
        let qmagsq = Float(x.x * x.x + x.y * x.y + x.z * x.z + x.w * x.w)
        
        if (abs(1.0 - qmagsq) < 2.107342e-08) {
            return x * Float(2.0 / (1.0 + qmagsq));
        }
        else {
            return x * (1.0 / Float(sqrt(qmagsq)));
        }
    }
    
    public func dot(_ v: Quaternion) -> Float {
        return x * v.x + y * v.y + z * v.z + w * v.w
    }
    
    public var normalized : Quaternion {
        return Quaternion.normalize(self)
    }
    
    public var lengthSquared : Float {
        return self.dot(self)
    }
    
    public var conjugate : Quaternion {
        return Quaternion(-self.x, -self.y, -self.z, self.w)
    }
    
    public var inverse : Quaternion {
        let lengthSquared = self.lengthSquared
        let scale = 1.0 / lengthSquared
        return self.conjugate * scale
    }
    
    public static func *(lhs: Matrix4x4f, rhs: Quaternion) -> Matrix4x4f {
        return lhs * Matrix4x4f(quaternion: rhs)
    }
    
    public static func *(lhs: Quaternion, rhs: Matrix4x4f) -> Matrix4x4f {
        return Matrix4x4f(quaternion: lhs) * rhs
    }
    
    public func slerp(to: Quaternion, t: Float) -> Quaternion {
        // Calculate angle between them.
        let cosHalfTheta = self.dot(to)
        
        // if this == other or this == -other then theta = 0 and we can return this
        if (abs(cosHalfTheta) >= 1.0) {
            return self;
        }
        
        // Calculate temporary values.
        let halfTheta : Float = acos(cosHalfTheta)
        let sinHalfTheta : Float = sqrt(1.0 - cosHalfTheta * cosHalfTheta)
        
        var x : Float, y : Float, z : Float, w : Float;
        
        // if theta = 180 degrees then result is not fully defined
        // we could rotate around any axis normal to qa or qb
        if (fabs(sinHalfTheta) < 0.001){
            w = (self.w * 0.5 + to.w * 0.5);
            x = (self.x * 0.5 + to.x * 0.5);
            y = (self.y * 0.5 + to.y * 0.5);
            z = (self.z * 0.5 + to.z * 0.5);
        } else {
            
            let ratioA = sinf((1 - t) * halfTheta) / sinHalfTheta
            let ratioB = sinf(t * halfTheta) / sinHalfTheta
            
            //calculate quaternion.
            w = (self.w * ratioA + to.w * ratioB);
            x = (self.x * ratioA + to.x * ratioB);
            y = (self.y * ratioA + to.y * ratioB);
            z = (self.z * ratioA + to.z * ratioB);
        }
        return Quaternion(x, y, z, w);
    }
    
}

///MARK: Quaternion extensions

public extension Quaternion {
    public init(_ m: Matrix4x4f) {
        var n4 : Float; // the norm of quaternion multiplied by 4
        var tr = m[0][0]
        tr += m[1][1]
        tr += m[2][2]; // trace of matrix
        
        let condition1 = m[0][0] > m[1][1]
        let condition2 = m[0][0] > m[2][2]
        if (tr > 0.0){
            let x = m[1][2] - m[2][1]
            let y = m[2][0] - m[0][2]
            let z = m[0][1] - m[1][0]
            let w = tr + 1.0
            self = Quaternion(x, y, z, w);
            n4 = self.w;
            
        } else if condition1 && condition2 {
            var x = 1.0 + m[0][0]
            x -= m[1][1]
            x -= m[2][2]
            let y = m[1][0] + m[0][1]
            let z = m[2][0] + m[0][2]
            let w = m[1][2] - m[2][1]
            self = Quaternion(x, y, z, w);
            n4 = self.x;
        } else if ( m[1][1] > m[2][2] ){
            let x = m[1][0] + m[0][1]
            var y = 1.0 + m[1][1]
            y -= m[0][0]
            y -= m[2][2]
            let z = m[2][1] + m[1][2]
            let w = m[2][0] - m[0][2]
            self = Quaternion( x, y, z, w );
            n4 = self.y;
        } else {
            let x = m[2][0] + m[0][2]
            let y = m[2][1] + m[1][2]
            var z = 1.0 + m[2][2]
            z -= m[0][0]
            z -= m[1][1]
            let w = m[0][1] - m[1][0]
            
            self = Quaternion(x, y, z, w);
            n4 = self.z;
        }
        
        n4 = sqrt(n4)
        
        self *= 0.5 / n4
    }
}

