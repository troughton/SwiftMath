// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

#if !NOSIMD
import simd

/// Represents a standard 4x4 transformation matrix.
/// - remark:
/// Matrices are stored in column-major order
public struct Matrix2x2f {
    public var d: float2x2 = float2x2()
    
    //MARK: - initializers
    
    /// Creates an instance initialized to zero
    @inlinable
    public init() {
    }
    
    /// Creates an instance using the vector to initialize the diagonal elements
    @inlinable
    public init(diagonal v: Vector2f) {
        self.init()
        self.d = float2x2(diagonal: v)
    }
    
    /// Creates an instance with the specified columns
    ///
    /// - parameter c0: a vector representing column 0
    /// - parameter c1: a vector representing column 1
    /// - parameter c2: a vector representing column 2
    public init(_ c0: Vector2f, _ c1: Vector2f) {
        self.d = float2x2(columns: (c0, c1))
    }
    
    //MARK:- properties
    
    @inlinable
    public var inverse: Matrix2x2f {
        return unsafeBitCast(d.inverse, to: Matrix2x2f.self)
    }
    
    @inlinable
    public var transpose: Matrix2x2f {
        return unsafeBitCast(d.transpose, to: Matrix2x2f.self)
    }
    
    //MARK:- operators
    
    @inlinable
    public static prefix func -(lhs: Matrix2x2f) -> Matrix2x2f {
        return unsafeBitCast(-lhs.d, to: Matrix2x2f.self)
    }
    
    @inlinable
    public static func *(lhs: Matrix2x2f, rhs: Float) -> Matrix2x2f {
        return unsafeBitCast(lhs.d * rhs, to: Matrix2x2f.self)
    }
    
    @inlinable
    public static func *(lhs: Matrix2x2f, rhs: Matrix2x2f) -> Matrix2x2f {
        return unsafeBitCast(lhs.d * rhs.d, to: Matrix2x2f.self)
    }
    
    // MARK: - subscript operations
    
    /// Access the `col`th column vector
    @inlinable
    public subscript(col: Int) -> Vector2f {
        get {
            return d[col]
        }
        
        set {
            d[col] = newValue
        }
    }
    
    /// Access the `col`th column vector and then `row`th element
    @inlinable
    public subscript(col: Int, row: Int) -> Float {
        get {
            return d[col, row]
        }
        
        set {
            d[col, row] = newValue
        }
    }
}

extension Matrix2x2f {
    
    @inlinable
    public static func *(lhs: Matrix2x2f, rhs: Vector2f) -> Vector2f {
        return lhs.d * rhs
    }
    
    @inlinable
    public static func *(lhs: Vector2f, rhs: Matrix2x2f) -> Vector2f {
        return lhs * rhs.d
    }
}
    
#endif
