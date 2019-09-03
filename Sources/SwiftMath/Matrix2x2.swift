// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Swift

extension Matrix2x2f {
    public init(_ m: Matrix3x3f) {
        self.init(m[0].xy, m[1].xy)
    }
    
    public init(_ m: Matrix4x4f) {
        self.init(m[0].xy, m[1].xy)
    }
}

extension Matrix2x2f: CustomStringConvertible {
    
    /// Displays the matrix in column-major order
    public var description: String {
        return "Matrix2x2f(\n\(self[0]), \(self[1]))\n)"
    }
}


extension Matrix2x2f : CustomDebugStringConvertible {
    public var debugDescription : String {
        return self.description
    }
}

@inlinable
public func interpolate(from m1: Matrix2x2f, to m: Matrix2x2f, factor t: Float) -> Matrix2x2f {
    return Matrix2x2f(
        m1[1, 1] + (m[1, 1] - m1[1, 1]) * t,
        m1[1, 2] + (m[1, 2] - m1[1, 2]) * t,
        m1[2, 1] + (m[2, 1] - m1[2, 1]) * t,
        m1[2, 2] + (m[2, 2] - m1[2, 2]) * t
    )
}
