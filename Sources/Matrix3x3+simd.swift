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
        //@inline(__always)
        public init() {
            self.d = float3x3()
        }
        
        /// Creates an instance using the vector to initialize the diagonal elements
        //@inline(__always)
        public init(diagonal v: Vector3f) {
            self.d = float3x3(diagonal: v.d)
        }
        
        /// Creates an instance with the specified columns
        ///
        /// - parameter c0: a vector representing column 0
        /// - parameter c1: a vector representing column 1
        /// - parameter c2: a vector representing column 2
        //@inline(__always)
        public init(_ c0: Vector3f, _ c1: Vector3f, _ c2: Vector3f) {
            self.d = float3x3(matrix_float3x3(columns: (c0.d, c1.d, c2.d)))
        }
        
        //MARK:- properties
        
        public var inversed: Matrix3x3f {
            return unsafeBitCast(d.inverse, to: Matrix3x3f.self)
        }
        
        //MARK:- operators
        
        //@inline(__always)
        public static prefix func -(lhs: Matrix3x3f) -> Matrix3x3f {
            return unsafeBitCast(-lhs.d, to: Matrix3x3f.self)
        }
        
        //@inline(__always)
        public static func *(lhs: Matrix3x3f, rhs: Float) -> Matrix3x3f {
            return unsafeBitCast(lhs.d * rhs, to: Matrix3x3f.self)
        }
        
        //@inline(__always)
        public static func *(lhs: Matrix3x3f, rhs: Matrix3x3f) -> Matrix3x3f {
            return unsafeBitCast(lhs.d * rhs.d, to: Matrix3x3f.self)
        }
    }
    
#endif
