// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

public typealias vec3 = Vector3f

extension Vector3f : Vector { }

public extension Vector3f {
    //MARK: - initializers
    
    public init(_ v: Vector4f) {
        self.init(v.x, v.y, v.z)
    }
    
    public init(_ v: Vector2f) {
        self.init(v.x, v.y, 0.0)
    }
    
    public init(x: Int, y: Int, z: Int) {
        self.init(x: Float(x), y: Float(y), z: Float(z))
    }
    
    public init(_ x: Int, _ y: Int, _ z: Int) {
        self.init(x: Float(x), y: Float(y), z: Float(z))
    }
}

public func min(_ a: Vector3f, _ b: Vector3f) -> Vector3f {
    return Vector3f(min(a.x, b.x), min(a.y, b.y), min(a.z, b.z))
}

public func max(_ a: Vector3f, _ b: Vector3f) -> Vector3f {
    return Vector3f(max(a.x, b.x), max(a.y, b.y), max(a.z, b.z))
}

public extension Vector3f {
    public var isZero: Bool {
        return x == 0.0 && y == 0.0 && z == 0.0
    }
    
    public static let zero = Vector3f()
}

extension Vector3f: CustomStringConvertible {
    public var description: String {
        return "Vector3f(x: \(x), y: \(y), z: \(z))"
    }
}
