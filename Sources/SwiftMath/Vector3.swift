// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Foundation

public typealias Vector3f = SIMD3<Float>

extension SIMD3 {
    
    @inlinable
    public var s: Scalar { get { return self.x } set { self.x = newValue } }
    @inlinable
    public var t: Scalar { get { return self.y } set { self.y = newValue } }
    @inlinable
    public var p: Scalar { get { return self.z } set { self.z = newValue } }
    
    @inlinable
    public init(_ xy: SIMD2<Scalar>, _ z: Scalar) {
        self.init(xy.x, xy.y, z)
    }
    
    @inlinable
    public init(_ v: Scalar) {
        self.init(repeating: v)
    }
    
}

extension Vector3f {
    public var orthonormalBasis : (tangent: Vector3f, bitangent: Vector3f) {
        let n = self
        let sign : Float = n.z.sign == .plus ? 1.0 : -1.0
        let a = -1.0 / (sign + n.z);
        let b = n.x * n.y * a
        let b1 = Vector3f(1.0 + sign * n.x * n.x * a, sign * b, -sign * n.x)
        let b2 = Vector3f(b, sign + n.y * n.y * a, -n.y)
        return (b1, b2)
    }
    
    public static func randomOnSphere(sample: Vector2f = Vector2f(Float.random(in: 0...1.0), Float.random(in: 0...1.0))) -> Vector3f {
        let z = 1.0 - 2.0 * sample.x
        let r = Swift.max(0.0, 1.0 - z*z).squareRoot()
        let phi = 2.0 * .pi * sample.y
        let x = Foundation.cos(phi)
        let y = Foundation.sin(phi)
        
        return Vector3f(r * x, r * y, z)
    }
    
    public static func randomOnHemisphere(sample: Vector2f = Vector2f(Float.random(in: 0...1.0), Float.random(in: 0...1.0))) -> Vector3f {
        
        let phi = 2.0 * .pi * sample.x
        
        let sinPhi = Foundation.sin(phi)
        let cosPhi = Foundation.cos(phi)
        let cosTheta = 1.0 - sample.y
        let sinTheta = (1.0 - cosTheta * cosTheta).squareRoot()
        
        return Vector3f(sinTheta * cosPhi, sinTheta * sinPhi, cosTheta)
    }
}
