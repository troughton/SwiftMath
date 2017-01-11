// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

#if !NOSIMD
import simd

/// Represents a standard 4x4 transformation matrix.
/// - remark:
/// Matrices are stored in column-major order
public struct Matrix3x3f {
    internal var d: float3x3
    
    //MARK: - initializers
    
    /// Creates an instance initialized to zero
    public init() {
        self.d = float3x3()
    }
    
    /// Creates an instance using the vector to initialize the diagonal elements
    public init(diagonal v: Vector3f) {
        self.d = float3x3(diagonal: v.d)
    }
    
    /// Creates an instance with the specified columns
    ///
    /// - parameter c0: a vector representing column 0
    /// - parameter c1: a vector representing column 1
    /// - parameter c2: a vector representing column 2
    public init(_ c0: Vector3f, _ c1: Vector3f, _ c2: Vector3f) {
        self.d = float3x3(matrix_float3x3(columns: (c0.d, c1.d, c2.d)))
    }
    
    //MARK:- properties
    
    public var inversed: Matrix3x3f {
        return unsafeBitCast(d.inverse, to: Matrix3x3f.self)
    }
    
    //MARK:- operators
    
    public static prefix func -(lhs: Matrix3x3f) -> Matrix3x3f {
        return unsafeBitCast(-lhs.d, to: Matrix3x3f.self)
    }
    
    public static func *(lhs: Matrix3x3f, rhs: Float) -> Matrix3x3f {
        return unsafeBitCast(lhs.d * rhs, to: Matrix3x3f.self)
    }
    
    public static func *(lhs: Matrix3x3f, rhs: Matrix3x3f) -> Matrix3x3f {
        return unsafeBitCast(lhs.d * rhs.d, to: Matrix3x3f.self)
    }
    
    // MARK: - subscript operations
    
    /// Access the `col`th column vector
    public subscript(col: Int) -> Vector3f {
        get {
            return unsafeBitCast(d[col], to: Vector3f.self)
        }
        
        set {
            d[col] = newValue.d
        }
    }
    
    /// Access the `col`th column vector and then `row`th element
    public subscript(col: Int, row: Int) -> Float {
        get {
            return d[col, row]
        }
        
        set {
            d[col, row] = newValue
        }
    }
}
    
    public extension Matrix3x3f {
        /// Returns the identity matrix
        public static let identity = Matrix3x3f(diagonal: vec3(1.0))
        
        /// Creates a new instance from the values provided in row-major order
        public init(
            _ m00: Float, _ m01: Float, _ m02: Float,
            _ m10: Float, _ m11: Float, _ m12: Float,
            _ m20: Float, _ m21: Float, _ m22: Float) {
            self.init(
                vec3(m00, m10, m20),
                vec3(m01, m11, m21),
                vec3(m02, m12, m22)
            )
        }
        
        public init(_ array: [Float]) {
            self = Matrix3x3f()
            for (i, val) in array.enumerated() {
                self[i / 3][i % 3] = val
            }
        }
        
    }
#endif
