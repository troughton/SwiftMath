// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

import Swift

extension Matrix3x3f: CustomStringConvertible {
    
    /// Displays the matrix in column-major order
    public var description: String {
        return "Matrix3x3f(\n\(self[0]), \(self[1]), \(self[2]))\n)"
    }
}

