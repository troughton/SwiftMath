//
//  Primitives.swift
//  InterdimensionalLlama
//
//  Created by Thomas Roughton on 18/11/16.
//
//

import Swift

public struct AxisAlignedBoundingBox {
    public var min : Vector3f
    public var max : Vector3f
    
    public init(min: Vector3f, max: Vector3f) {
        self.min = min
        self.max = max
    }
    
    public mutating func expand(by factor: Float) {
        self.min -= Vector3f(factor)
        self.max += Vector3f(factor)
    }
}

public struct Cylinder {
    public var position : Vector3f
    public var end : Vector3f
    public var radius : Float
    
}

public struct Disk {
    public var centre : Vector3f
    public var normal : Vector3f
    public var radius : Float
    
}

public struct OrientedBoundingBox {
    public var transform : Matrix4x4f
    
    public init(transform: Matrix4x4f = Matrix4x4f.identity) {
        self.transform = transform
    }
}

public struct Plane {
    public var normal : Vector3f
    public var distance : Float
}

public struct Ray {
    
    public var origin : Vector3f
    public var direction : Vector3f
    
    public init(origin: Vector3f = Vector3f(0), direction: Vector3f = Vector3f(0)) {
        self.origin = origin
        self.direction = direction
    }
    
    public init(fromScreenSpaceX x: Float, y: Float, mvp: Matrix4x4f) {
        self = Ray(fromScreenSpaceX: x, y: y, inverseMVP: mvp.inversed)
    }
    
    public init(fromScreenSpaceX x: Float, y: Float, inverseMVP: Matrix4x4f) {
        let ray = Ray(origin: Vector3f(x, y, 0), direction: Vector3f(0, 0, 1))
        let viewRay = inverseMVP * ray
        self = viewRay
    }
    
    public func at(t: Float) -> Vector3f {
        return self.origin + Vector3f(t) * self.direction
    }
    
    public static func *(lhs: Matrix4x4f, rhs: Ray) -> Ray {
        var ray = Ray()
        
        let origin = lhs * Vector4f(rhs.origin, 1)
        
        ray.origin = origin.xyz * Vector3f(1.0 / origin.w)
        
        let direction = Vector3f(
            lhs[2][0] - (lhs[2][3] * ray.origin.x),
            lhs[2][1] - (lhs[2][3] * ray.origin.y),
            lhs[2][2] - (lhs[2][3] * ray.origin.z)
            ).normalized
        ray.direction = direction
        return ray
    }
    
    public func intersectionAt(y: Float) -> Vector3f {
        let t = (y - self.origin.y) / self.direction.y
        return self.at(t: t)
    }
}

public struct Sphere {
    public var centre : Vector3f
    public var radius : Float
}

public struct Triangle {
    public var v0 : Vector3f
    public var v1 : Vector3f
    public var v2 : Vector3f
}

public struct Intersection {
    public var position : Vector3f
    public var normal : Vector3f
    public var distance : Float
}
