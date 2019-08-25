//
//  Vector.swift
//  SwiftMath
//
//  Created by Thomas Roughton on 11/01/17.
//
//

import Swift

@inlinable
public func dot<V : SIMD>(_ a: V, _ b: V) -> V.Scalar where V.Scalar : FloatingPoint {
    var total = V.Scalar(0)
    for i in a.indices {
        total += a[i] * b[i]
    }
    return total
}

@inlinable
public func componentSum<V : SIMD>(_ v: V) -> V.Scalar where V.Scalar : FloatingPoint {
    var total = V.Scalar(0)
    for i in v.indices {
        total += v[i]
    }
    return total
}

@inlinable
public func dot<V : SIMD>(_ a: V, _ b: V) -> V.Scalar where V.Scalar : BinaryInteger {
    var total = V.Scalar(0)
    for i in a.indices {
        total += a[i] * b[i]
    }
    return total
}

@inlinable
public func componentSum<V : SIMD>(_ v: V) -> V.Scalar where V.Scalar : BinaryInteger {
    var total = V.Scalar(0)
    for i in v.indices {
        total += v[i]
    }
    return total
}

extension SIMD where Scalar : FloatingPoint {
    @inlinable
    public var lengthSquared : Scalar {
        return dot(self, self)
    }
    
    @inlinable
    public var length : Scalar {
        return self.lengthSquared.squareRoot()
    }
}

@inlinable
public func normalize<V : SIMD>(_ v: V) -> V where V.Scalar : FloatingPoint {
    return v / V(repeating: v.length)
}

@inlinable
public func cross<S>(_ u: SIMD2<S>, _ v: SIMD2<S>) -> S where S : Numeric {
    return u.x * v.y - u.y * v.x
}

@inlinable
public func cross<S>(_ u: SIMD3<S>, _ v: SIMD3<S>) -> SIMD3<S> where S : Numeric {
    return SIMD3<S>(u.y * v.z - u.z * v.y, u.z * v.x - u.x * v.z, u.x * v.y - u.y * v.x)
}

@inlinable
public func interpolate<V : SIMD>(from: V, to: V, factor: V.Scalar) -> V where V.Scalar : FloatingPoint {
    return from + (to - from) * V(repeating: factor)
}

@inlinable
public func floor<V : SIMD>(_ v: V) -> V where V.Scalar : FloatingPoint {
    var result = v
    for i in v.indices {
        result[i] = result[i].rounded(.down)
    }
    return result
}

@inlinable
public func ceil<V : SIMD>(_ v: V) -> V where V.Scalar : FloatingPoint {
    var result = v
    for i in v.indices {
        result[i] = result[i].rounded(.up)
    }
    return result
}

@inlinable
public func abs<V : SIMD>(_ v: V) -> V where V.Scalar : Comparable & SignedNumeric {
    var result = v
    for i in v.indices {
        result[i] = abs(result[i])
    }
    return result
}

@inlinable
public func min<V : SIMD>(_ a: V, _ b: V) -> V where V.Scalar : Comparable {
    var result = a
    for i in a.indices {
        result[i] = min(a[i], b[i])
    }
    return result
}

@inlinable
public func max<V : SIMD>(_ a: V, _ b: V) -> V where V.Scalar : Comparable {
    var result = a
    for i in a.indices {
        result[i] = max(a[i], b[i])
    }
    return result
}

@inlinable
public func clamp<V : SIMD>(_ x: V, min minVec: V, max maxVec: V) -> V where V.Scalar : Comparable {
    return min(max(minVec, x), maxVec)
}
