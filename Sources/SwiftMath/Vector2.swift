// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

public typealias Vector2f = SIMD2<Float>

extension Vector2f {
    
    @inlinable
    public static func *(lhs: Matrix4x4f, rhs: Vector2f) -> Vector2f {
        let res = lhs * Vector4f(rhs.x, rhs.y, 0, 1)
        return Vector2f(res.x, res.y)
    }
    
    @inlinable
    public static func *(lhs: Vector2f, rhs: Matrix4x4f) -> Vector2f {
        let res = Vector4f(lhs.x, lhs.y, 0, 1)
        return Vector2f(res.x, res.y)
    }
    
    @inlinable
    public init(_ v: Scalar) {
        self.init(repeating: v)
    }
}
