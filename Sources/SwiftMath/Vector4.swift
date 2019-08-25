// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

public typealias Vector4f = SIMD4<Float>

extension SIMD4 {
    
    @inlinable
    public var r: Scalar { get { return self.x } set { self.x = newValue } }
    @inlinable
    public var g: Scalar { get { return self.y } set { self.y = newValue } }
    @inlinable
    public var b: Scalar { get { return self.z } set { self.z = newValue } }
    @inlinable
    public var a: Scalar { get { return self.w } set { self.w = newValue } }
    
    @inlinable
    public var s: Scalar { get { return self.x } set { self.x = newValue } }
    @inlinable
    public var t: Scalar { get { return self.y } set { self.y = newValue } }
    @inlinable
    public var p: Scalar { get { return self.z } set { self.z = newValue } }
    @inlinable
    public var q: Scalar { get { return self.w } set { self.w = newValue } }
    
    // MARK: - initializers
    
    @inlinable
    public init(_ xyz: SIMD3<Scalar>, _ w: Scalar) {
        self = SIMD4<Scalar>(xyz.x, xyz.y, xyz.z, w)
    }
    
    @inlinable
    public init(_ xy: SIMD2<Scalar>, _ zw: SIMD2<Scalar>) {
        self = SIMD4<Scalar>(xy.x, xy.y, zw.x, zw.y)
    }
    
    @inlinable
    public init(_ v: Scalar) {
        self.init(repeating: v)
    }
    
}
