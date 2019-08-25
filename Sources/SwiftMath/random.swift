//
//  random.swift
//  org.SwiftGFX.SwiftMath
//
//  Created by Andrey Volodin on 29.09.16.
//
//

import Foundation

extension Vector2f {
    /**  
     Returns a random Vector2f with a length equal to 1.0.
     */
    public var randomOnUnitCircle: Vector2f {
        while true {
            let p = p2d(Float.random(in: -1...1), Float.random(in: -1...1))
            let lsq = p.lengthSquared
            if 0.1 < lsq && lsq < 1.0 {
                return p * Float(1.0 / sqrt(lsq))
            }
        }
    }
    
    /**
     Returns a random Vector2f with a length less than 1.0.
    */
    public var randomInUnitCircle: Vector2f {
        while true {
            let p = p2d(Float.random(in: -1...1), Float.random(in: -1...1))
            let lsq = p.lengthSquared
            if lsq < 1.0 { return p }
        }
    }
}
