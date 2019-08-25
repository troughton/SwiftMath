//
//  utils.swift
//  org.SwiftGFX.SwiftMath
//
//  Created by Andrey Volodin on 29.09.16.
//
//

import Foundation

extension UInt {
    
    /** returns the Next Power of Two value.
     
     Examples:
     - If "value" is 15, it will return 16.
     - If "value" is 16, it will return 16.
     - If "value" is 17, it will return 32.
     */
    public var nextPOT: UInt {
        var x = self - 1
        x = x | (x >> 1)
        x = x | (x >> 2)
        x = x | (x >> 4)
        x = x | (x >> 8)
        x = x | (x >> 16)
        return x + 1
    }
}

extension Float {
    @inlinable
    public init(half: UInt16) {
        let magic = Float(bitPattern: (113 << 23) as UInt32)
        let shifted_exp : UInt32 = UInt32(0x7c00) << UInt32(13); // exponent mask after shift
        
        var o : UInt32 = 0
        o = UInt32(half & UInt16(0x7fff)) << UInt32(13);     // exponent/mantissa bits
        
        let exp : UInt32 = shifted_exp & o   // just the exponent
        o += UInt32(127 - 15) << UInt32(23);        // exponent adjust
        
        // handle exponent special cases
        if (exp == shifted_exp) { // Inf/NaN?
            o += UInt32(128 - 16) << UInt32(23);    // extra exp adjust
        } else if (exp == 0) { // Zero/Denormal?
            o += UInt32(1) << UInt32(23)             // extra exp adjust
            
            var oFloat = Float(bitPattern: o)
            oFloat -= magic;             // renormalize
            o = oFloat.bitPattern
        }
        
        o |= UInt32(half & 0x8000) << UInt32(16);    // sign bit
        
        self = Float(bitPattern: o)
    }
}

/// Flips the y (since in uvs y increases down, while for cubemaps it increases up.
public func cubeMapUVToDirection(uv: Vector2f, face: Int) -> Vector3f {
    let scaledUV = (uv - Vector2f(repeating: 0.5)) * Vector2f(2, -2)
    
    switch face {
    case 0:
        return normalize(Vector3f(1, scaledUV.y, -scaledUV.x))
    case 1:
        return normalize(Vector3f(-1, scaledUV.y, scaledUV.x))
    case 2:
        return normalize(Vector3f(scaledUV.x, 1, -scaledUV.y))
    case 3:
        return normalize(Vector3f(scaledUV.x, -1, scaledUV.y))
    case 4:
        return normalize(Vector3f(scaledUV.x, scaledUV.y, 1))
    case 5:
        return normalize(Vector3f(-scaledUV.x, scaledUV.y, -1))
    default:
        fatalError("Invalid cubemap face index.")
    }
}
