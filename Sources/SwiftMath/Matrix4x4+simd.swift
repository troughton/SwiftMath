// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

#if !NOSIMD
import simd

/// Represents a standard 4x4 transformation matrix.
/// - remark:
/// Matrices are stored in column-major order
public struct Matrix4x4f : Equatable {
    public var d: float4x4 = float4x4()
    
    //MARK: - initializers
	
	/// Creates an instance initialized to zero
    public init() {
    }
	
	/// Creates an instance using the vector to initialize the diagonal elements
    @inlinable
    public init(diagonal v: Vector4f) {
        self.init()
        self.d = float4x4(diagonal: v)
    }
    
    /// Creates an instance with the specified columns
    ///
    /// - parameter c0: a vector representing column 0
    /// - parameter c1: a vector representing column 1
    /// - parameter c2: a vector representing column 2
    /// - parameter c3: a vector representing column 3
    public init(_ c0: Vector4f, _ c1: Vector4f, _ c2: Vector4f, _ c3: Vector4f) {
        self.d = float4x4(columns: (c0, c1, c2, c3))
    }
    
    //MARK:- properties
    
    @inlinable
    public var inverse : Matrix4x4f {
        return unsafeBitCast(d.inverse, to: Matrix4x4f.self)
    }
    
    @inlinable
    public var transpose : Matrix4x4f {
        return unsafeBitCast(d.transpose, to: Matrix4x4f.self)
    }
    
    // MARK: - subscript operations
    
    /// Access the `col`th column vector
    @inlinable
    public subscript(col: Int) -> Vector4f {
        get {
            switch col {
            case 0:
                return d.columns.0
            case 1:
                return d.columns.1
            case 2:
                return d.columns.2
            case 3:
                return d.columns.3
            default:
                fatalError()
            }
        }
        
        set {
            switch col {
            case 0:
                d.columns.0 = newValue
            case 1:
                d.columns.1 = newValue
            case 2:
                d.columns.2 = newValue
            case 3:
                d.columns.3 = newValue
            default:
                fatalError()
            }
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
    
    //MARK:- operators
    
    @inlinable
    public static prefix func -(lhs: Matrix4x4f) -> Matrix4x4f {
        return unsafeBitCast(-lhs.d, to: Matrix4x4f.self)
    }
    
    @inlinable
    public static func *(lhs: Matrix4x4f, rhs: Float) -> Matrix4x4f {
        return unsafeBitCast(lhs.d * rhs, to: Matrix4x4f.self)
    }
    
    @inlinable
    public static func *(lhs: Matrix4x4f, rhs: Matrix4x4f) -> Matrix4x4f {
        return unsafeBitCast(lhs.d * rhs.d, to: Matrix4x4f.self)
    }
    
    @inlinable
    public static func ==(lhs: Matrix4x4f, rhs: Matrix4x4f) -> Bool {
        return lhs[0] == rhs[0] && lhs[1] == rhs[1] && lhs[2] == rhs[2] && lhs[3] == rhs[3]
    }
}

extension Matrix4x4f {
    
    @inlinable
    public static func *(lhs: Matrix4x4f, rhs: Vector4f) -> Vector4f {
        return lhs.d * rhs
    }
    
    @inlinable
    public static func *(lhs: Vector4f, rhs: Matrix4x4f) -> Vector4f {
        return lhs * rhs.d
    }
}

    
#endif
    
