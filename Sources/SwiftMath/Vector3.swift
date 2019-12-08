// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Real

extension SIMD3 {
    @inlinable
    public init(_ xy: SIMD2<Scalar>, _ z: Scalar) {
        self.init(xy.x, xy.y, z)
    }
}

extension SIMD3 where Scalar: Real, Scalar : BinaryFloatingPoint, Scalar.RawSignificand : FixedWidthInteger {
    @inlinable
    public var orthonormalBasis : (tangent: SIMD3<Scalar>, bitangent: SIMD3<Scalar>) {
        let n = self
        let sign : Scalar = n.z.sign == .plus ? 1.0 : -1.0
        let a = -1.0 / (sign + n.z);
        let b = n.x * n.y * a
        let b1 = SIMD3<Scalar>(1.0 + sign * n.x * n.x * a, sign * b, -sign * n.x)
        let b2 = SIMD3<Scalar>(b, sign + n.y * n.y * a, -n.y)
        return (b1, b2)
    }
    
    @inlinable
    public static func randomOnSphere(sample: SIMD2<Scalar> = SIMD2<Scalar>.random(in: 0...1.0)) -> SIMD3<Scalar> {
        let z = 1.0 - 2.0 * sample.x
        let r = Swift.max(0.0, 1.0 - z*z).squareRoot()
        let phi = 2.0 * Scalar.pi * sample.y
        let x = Scalar.cos(phi)
        let y = Scalar.sin(phi)
        
        return SIMD3<Scalar>(r * x, r * y, z)
    }
    
    @inlinable
    public static func randomOnHemisphere(sample: SIMD2<Scalar> = SIMD2<Scalar>.random(in: 0...1.0)) -> SIMD3<Scalar> {
        let phi = 2.0 * Scalar.pi * sample.x
        
        let sinPhi = Scalar.sin(phi)
        let cosPhi = Scalar.cos(phi)
        let cosTheta = 1.0 - sample.y
        let sinTheta = (1.0 - cosTheta * cosTheta).squareRoot()
        
        return SIMD3<Scalar>(sinTheta * cosPhi, sinTheta * sinPhi, cosTheta)
    }
}
