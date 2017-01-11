// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Swift

extension Matrix3x3f: CustomStringConvertible {
    /// Displays the matrix in row-major order
    public var description: String {
        return "Matrix3x3f(\n" +
            "m00: \(self[0,0]), m01: \(self[1,0]), m02: \(self[2,0]),\n" +
            "m10: \(self[0,1]), m11: \(self[1,1]), m12: \(self[2,1]),\n" +
            "m20: \(self[0,2]), m21: \(self[1,2]), m22: \(self[2,2]),\n" +
        ")"
    }
}

