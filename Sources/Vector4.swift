// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

public typealias vec4 = Vector4f

extension Vector4f : Vector { }

public extension Vector4f {
    //MARK: - initializers
    
    public init(_ v: Vector2f) {
        self.init(v.x, v.y, 0.0, 1.0)
    }
  
    public init(_ v: Vector3f) {
        self.init(v.x, v.y, v.z, 1.0)
    }
    
    public init(x: Int, y: Int, z: Int, w: Int) {
        self.init(x: Float(x), y: Float(y), z: Float(z), w: Float(w))
    }
  
    public init(_ x: Int, _ y: Int, _ z: Int, _ w: Int) {
        self.init(x: Float(x), y: Float(y), z: Float(z), w: Float(w))
    }
    
    public init(_ xyz: Vector3f, _ w: Float) {
        self = Vector4f(xyz.x, xyz.y, xyz.z, w)
    }
}

public extension Vector4f {
    public var isZero: Bool {
        return x == 0.0 && y == 0.0 && z == 0.0 && w == 0.0
    }
    
    public static let zero = Vector4f()
}

extension Vector4f: CustomStringConvertible {
    public var description: String {
        return "Vector4f(x: \(x), y: \(y), z: \(z), w: \(w))"
    }
}

public extension Vector4f {
    
    public static func +=(lhs: inout Vector4f, rhs: Vector4f) {
        lhs = lhs + rhs
    }
    
    public static func -=(lhs: inout Vector4f, rhs: Vector4f) {
        lhs = lhs - rhs
    }
    
    public static func *=(lhs: inout Vector4f, rhs: Vector4f) {
        lhs = lhs * rhs
    }
    
    public static func /=(lhs: inout Vector4f, rhs: Vector4f) {
        lhs = lhs / rhs
    }
    
    public static func *=(lhs: inout Vector4f, rhs: Float) {
        lhs = lhs * rhs
    }
    
    public static func /=(lhs: inout Vector4f, rhs: Float) {
        lhs = lhs / rhs
    }
    
}
