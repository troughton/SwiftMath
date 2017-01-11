// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

#if !(os(OSX) || os(iOS) || os(tvOS) || os(watchOS))

import Glibc
    
@inline(__always)
internal func __sincosf(_ a: Float, _ sina: inout Float, _ cosa: inout Float) {
    sina = sin(a)
    cosa = cos(a)
}

#else
    
import Darwin

#endif

public func sincos(_ a: Angle, _ sina: inout Float, _ cosa: inout Float)  {
    __sincosf(a.radians, &sina, &cosa)
}

public func sincos(_ a: Angle) -> (sin: Float, cos: Float) {
    var s: Float = 0.0
    var c: Float = 0.0
    sincos(a, &s, &c)
    
    return (sin: s, cos: c)
}

public func sin(_ a: Angle) -> Float {
	return sin(a.radians)
}

public func cos(_ a: Angle) -> Float {
	return cos(a.radians)
}

public func tan(_ a: Angle) -> Float {
    return tan(a.radians)
}
