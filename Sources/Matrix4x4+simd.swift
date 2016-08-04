// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

#if !NOSIMD
    import simd
    
    public struct Matrix4x4f {
        var d: float4x4
        
        //MARK:- initializers
        
        public init() {
            self.d = float4x4()
        }
        
        public init(diagonal v: Vector4f) {
            self.d = float4x4(diagonal: v.d)
        }
        
        public init(_ r0: Vector4f, _ r1: Vector4f, _ r2: Vector4f, _ r3: Vector4f) {
            self.d = float4x4(matrix_float4x4(columns: (r0.d, r1.d, r2.d, r3.d)))
        }
        
        //MARK:- operators
        
        public static prefix func -(lhs: Matrix4x4f) -> Matrix4x4f {
            return unsafeBitCast(-lhs.d, to: Matrix4x4f.self)
        }
        
        public static func *(lhs: Matrix4x4f, rhs: Vector4f) -> Vector4f {
            return unsafeBitCast(lhs.d * rhs.d, to: Vector4f.self)
        }
        
        public static func *(lhs: Matrix4x4f, rhs: Float) -> Matrix4x4f {
            return unsafeBitCast(lhs.d * rhs, to: Matrix4x4f.self)
        }
        
        public static func *(lhs: Matrix4x4f, rhs: Matrix4x4f) -> Matrix4x4f {
            return unsafeBitCast(lhs.d * rhs.d, to: Matrix4x4f.self)
        }
    }
    
#endif
