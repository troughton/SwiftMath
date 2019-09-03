//
//  Matrix2x2fx3+nosimd.swift
//  SwiftMath
//
//  Created by Andrey Volodin on 16.12.16.
//
//

#if NOSIMD
public struct Matrix2x2f {
    public var m11: Float = 0.0
    public var m12: Float = 0.0
    
    public var m21: Float = 0.0
    public var m22: Float = 0.0
    
    public func toArray() -> [Float] {
        return [m11, m12, m21, m22]
    }
  
    public init() {}
    
    /// Creates an instance using the vector to initialize the diagonal elements
    public init(diagonal v: Vector2f) {
        m11 = v[0]
        m22 = v[1]
    }
    
    /// Creates an instance with the specified columns
    ///
    /// - parameter c0: a vector representing column 0
    /// - parameter c1: a vector representing column 1
    /// - parameter c2: a vector representing column 2
    public init(_ c0: Vector2f, _ c1: Vector2f, _ c2: Vector2f) {
        m11 = c0[0]
        m12 = c0[1]
        
        m21 = c1[0]
        m22 = c1[1]
    }
    
    /// Access the `col`th column vector
    public subscript(col: Int) -> Vector2f {
        get {
            switch col {
            case 0: return Vector2f(m11, m12)
            case 1: return Vector2f(m21, m22)
            default: fatalError("Index outside of bounds")
            }
        }
        
        set {
            switch col {
            case 0: m11 = newValue[0]; m12 = newValue[1];
            case 1: m21 = newValue[0]; m22 = newValue[1];
            default: fatalError("Index outside of bounds")
            }
        }
    }
    
    /// Access the `col`th column vector and then `row`th element
    public subscript(col: Int, row: Int) -> Float {
        get {
            switch col {
            case 0:
                switch row {
                case 0: return m11
                case 1: return m12
                default: fatalError("Index outside of bounds")
                }
            case 1:
                switch row {
                case 0: return m21
                case 1: return m22
                default: fatalError("Index outside of bounds")
                }
            default: fatalError("Index outside of bounds")
            }
        }
        
        set {
            switch col {
            case 0:
                switch row {
                case 0: m11 = newValue
                case 1: m12 = newValue
                default: fatalError("Index outside of bounds")
                }
            case 1:
                switch row {
                case 0: m21 = newValue
                case 1: m22 = newValue
                default: fatalError("Index outside of bounds")
                }
            default: fatalError("Index outside of bounds")
            }
        }
    }
    
    public var transpose: Matrix2x2f {
        return Matrix2x2f(m11, m21, m12, m22)
    }
    
    public static prefix func -(m: Matrix2x2f) -> Matrix2x2f {
        return Matrix2x2f(
            -m.m11, -m.m12,
            -m.m21, -m.m22
        )
    }
    
    public static func *(lhs: Matrix2x2f, rhs: Matrix2x2f) -> Matrix2x2f {
        return Matrix2x2f(
            lhs.m11 * rhs.m11 + lhs.m21 * rhs.m12,
            lhs.m12 * rhs.m11 + lhs.m22 * rhs.m12,
            lhs.m11 * rhs.m21 + lhs.m21 * rhs.m22,
            lhs.m12 * rhs.m21 + lhs.m22 * rhs.m22
        )
    }
    
    public static func *(lhs: Matrix2x2f, rhs: Float) -> Matrix2x2f {
        return Matrix2x2f(
            lhs.m11 * rhs, lhs.m12 * rhs,
            lhs.m21 * rhs, lhs.m22 * rhs
        )
    }
    
}
    
extension Matrix2x2f: Equatable {
    public static func ==(lhs: Matrix2x2f, rhs: Matrix2x2f) -> Bool {
        if lhs.m11 != rhs.m11 { return false }
        if lhs.m12 != rhs.m12 { return false }
        if lhs.m13 != rhs.m13 { return false }
        if lhs.m21 != rhs.m21 { return false }
        if lhs.m22 != rhs.m22 { return false }
        if lhs.m23 != rhs.m23 { return false }
        if lhs.m31 != rhs.m31 { return false }
        if lhs.m32 != rhs.m32 { return false }
        if lhs.m33 != rhs.m33 { return false }
        return true
    }
}
#endif

extension Matrix2x2f {
    /// Returns the identity matrix
    public static let identity = Matrix2x2f(diagonal: Vector2f(repeating: 1.0))
    
    /// Creates a new instance from the values provided in column-major order
    public init(
        _ m00: Float, _ m01: Float,
        _ m10: Float, _ m11: Float) {
        self.init(
            Vector2f(m00, m01),
            Vector2f(m10, m11)
        )
    }
    
    public init(_ array: [Float]) {
        self.init()
        for (i, val) in array.enumerated() {
            self[i / 2][i % 2] = val
        }
    }
    
}
