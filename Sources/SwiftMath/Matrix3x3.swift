// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Swift
import Real

@frozen
public struct Matrix3x3<Scalar: SIMDScalar & BinaryFloatingPoint> : Hashable, Codable {
    public var c0: SIMD3<Scalar> = SIMD3(1, 0, 0)
    public var c1: SIMD3<Scalar> = SIMD3(0, 1, 0)
    public var c2: SIMD3<Scalar> = SIMD3(0, 0, 1)
  
    @inlinable
    public init() {}
    
    /// Creates an instance using the vector to initialize the diagonal elements
    @inlinable
    public init(diagonal v: SIMD3<Scalar>) {
        self.c0 = SIMD3(v.x, 0, 0)
        self.c1 = SIMD3(0, v.y, 0)
        self.c2 = SIMD3(0, 0, v.z)
    }
    
    /// Creates an instance with the specified columns
    ///
    /// - parameter c0: a vector representing column 0
    /// - parameter c1: a vector representing column 1
    /// - parameter c2: a vector representing column 2
    @inlinable
    public init(_ c0: SIMD3<Scalar>, _ c1: SIMD3<Scalar>, _ c2: SIMD3<Scalar>) {
        self.c0 = c0
        self.c1 = c1
        self.c2 = c2
    }
    
    /// Access the `col`th column vector
    @inlinable
    public subscript(col: Int) -> SIMD3<Scalar> {
        get {
            switch col {
            case 0: return self.c0
            case 1: return self.c1
            case 2: return self.c2
            default: preconditionFailure("Index outside of bounds")
            }
        }
        
        set {
            switch col {
            case 0: self.c0 = newValue
            case 1: self.c1 = newValue
            case 2: self.c2 = newValue
            default: preconditionFailure("Index outside of bounds")
            }
        }
    }
    
    /// Access the `col`th column vector and then `row`th element
    @inlinable
    public subscript(row: Int, col: Int) -> Scalar {
        get {
            return self[col][row]
        }
        
        set {
            self[col][row] = newValue
        }
    }
    
    @inlinable
    public var adjugate: Matrix3x3 {
        return Matrix3x3(
            SIMD3<Scalar>(c1.y * c2.z - c1.z * c2.y,
                  c0.z * c2.y - c0.y * c2.z,
                  c0.y * c1.z - c0.z * c1.y),
            SIMD3<Scalar>(c1.z * c2.x - c1.x * c2.z,
                  c0.x * c2.z - c0.z * c2.x,
                  c0.z * c1.x - c0.x * c1.z),
            SIMD3<Scalar>(c1.x * c2.y - c1.y * c2.x,
                  c0.y * c2.x - c0.x * c2.y,
                  c0.x * c1.y - c0.y * c1.x)
        )
    }
    
    @inlinable
    public var determinant: Scalar {
        var result : Scalar = c0.x * c1.y * c2.z
        result += c0.y * c1.z * c2.x
        result += c0.z * c1.x * c2.y
        result -= c0.z * c1.y * c2.x
        result -= c0.x * c1.z * c2.y
        result -= c0.y * c1.x * c2.z
        return result
    }
    
    @inlinable
    public var transpose: Matrix3x3 {
        return Matrix3x3(SIMD3<Scalar>(self.c0.x, self.c1.x, self.c2.x),
                         SIMD3<Scalar>(self.c0.y, self.c1.y, self.c2.y),
                         SIMD3<Scalar>(self.c0.z, self.c1.z, self.c2.z)
        )
    }
    
    @inlinable
    public var inverse: Matrix3x3 {
        return adjugate * (1 / determinant)
    }
    
    @inlinable
    public static prefix func -(m: Matrix3x3) -> Matrix3x3 {
        return Matrix3x3(
        -m.c0,
        -m.c1,
        -m.c2
        )
    }
    
    @inlinable
    public static func *(lhs: Matrix3x3, rhs: Matrix3x3) -> Matrix3x3 {
        var c0 = lhs.c0 * SIMD3(repeating: rhs.c0.x)
        c0.addProduct(lhs.c1, SIMD3(repeating: rhs.c0.y))
        c0.addProduct(lhs.c2, SIMD3(repeating: rhs.c0.z))
        
        var c1 = lhs.c0 * SIMD3(repeating: rhs.c1.x)
        c1.addProduct(lhs.c1, SIMD3(repeating: rhs.c1.y))
        c1.addProduct(lhs.c2, SIMD3(repeating: rhs.c1.z))
        
        var c2 = lhs.c0 * SIMD3(repeating: rhs.c2.x)
        c2.addProduct(lhs.c1, SIMD3(repeating: rhs.c2.y))
        c2.addProduct(lhs.c2, SIMD3(repeating: rhs.c2.z))
        
        return Matrix3x3(c0, c1, c2)
    }
    
    @inlinable
    public static func *(lhs: Matrix3x3, rhs: SIMD3<Scalar>) -> SIMD3<Scalar> {
        var result = lhs.c0 * SIMD3(repeating: rhs.x)
        result.addProduct(lhs.c1, SIMD3(repeating: rhs.y))
        result.addProduct(lhs.c2, SIMD3(repeating: rhs.z))
        return result
    }
    
    @inlinable
    public static func *(lhs: SIMD3<Scalar>, rhs: Matrix3x3) -> SIMD3<Scalar> {
        var result = SIMD3(rhs.c0.x, rhs.c1.x, rhs.c2.x) * SIMD3(repeating: lhs.x)
        result.addProduct(SIMD3(rhs.c0.y, rhs.c1.y, rhs.c2.y), SIMD3(repeating: lhs.y))
        result.addProduct(SIMD3(rhs.c0.z, rhs.c1.z, rhs.c2.z), SIMD3(repeating: lhs.z))
        return result
    }
    
    @inlinable
    public static func *(lhs: Matrix3x3, rhs: Scalar) -> Matrix3x3 {
        return Matrix3x3(
            lhs.c0 * SIMD3(repeating: rhs),
            lhs.c1 * SIMD3(repeating: rhs),
            lhs.c2 * SIMD3(repeating: rhs)
        )
    }
    
}

extension Matrix3x3 {
    /// Returns the identity matrix
    @inlinable
    public static var identity : Matrix3x3 { return Matrix3x3(diagonal: SIMD3<Scalar>(repeating: 1)) }
    
    @inlinable
    public init(_ m: Matrix4x4<Scalar>) {
        self.init(m[0].xyz, m[1].xyz, m[2].xyz)
    }
    
}

extension Matrix3x3 where Scalar : Real {
    
    @inlinable
    public init(quaternion q: Quaternion<Scalar>) {
        self.init(diagonal: SIMD3<Scalar>(repeating: 1.0))
        
        let sqw : Scalar = q.w*q.w
        let sqx : Scalar = q.x*q.x
        let sqy : Scalar = q.y*q.y
        let sqz : Scalar = q.z*q.z
        
        // invs (inverse square length) is only required if quaternion is not already normalised
        let invs : Scalar = 1.0 / (sqx + sqy + sqz + sqw)
        self[0, 0] = ( sqx - sqy - sqz + sqw) * invs // since sqw + sqx + sqy + sqz =1/invs*invs
        self[1, 1] = (-sqx + sqy - sqz + sqw) * invs
        self[2, 2] = (-sqx - sqy + sqz + sqw) * invs
        
        var tmp1 = q.x*q.y
        var tmp2 = q.z*q.w
        self[1, 0] = 2.0 * (tmp1 + tmp2)*invs
        self[0, 1] = 2.0 * (tmp1 - tmp2)*invs
        
        tmp1 = q.x*q.z
        tmp2 = q.y*q.w
        self[2, 0] = 2.0 * (tmp1 - tmp2)*invs
        self[0, 2] = 2.0 * (tmp1 + tmp2)*invs
        tmp1 = q.y*q.z
        tmp2 = q.x*q.w
        self[2, 1] = 2.0 * (tmp1 + tmp2)*invs
        self[2, 2] = 2.0 * (tmp1 - tmp2)*invs
    }
}

extension Matrix3x3: CustomStringConvertible {
    
    /// Displays the matrix in column-major order
    public var description: String {
        return "Matrix3x3(\n\(self[0]), \(self[1]), \(self[2]))\n)"
    }
}

@inlinable
public func interpolate<Scalar>(from m0: Matrix3x3<Scalar>, to m1: Matrix3x3<Scalar>, factor t: Scalar) -> Matrix3x3<Scalar> {
    return Matrix3x3<Scalar>(
        m0.c0 + (m1.c0 - m0.c0) * t,
        m0.c1 + (m1.c1 - m0.c1) * t,
        m0.c2 + (m1.c2 - m0.c2) * t
    )
}

public typealias Matrix3x3f = Matrix3x3<Float>
