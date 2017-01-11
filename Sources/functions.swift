// Copyright 2016 Stuart Carnie.
// License: https://github.com/SwiftGFX/SwiftMath#license-bsd-2-clause
//

/// Returns x, such that min ≤ x ≤ max
///
/// - parameter x:   value to be clamped
/// - parameter min: minimum
/// - parameter max: maximum
public func clamp<T:Comparable>(_ x: T, min _min: T, max _max: T) -> T {
    return min(max(x, _min), _max)
}

/// Returns x, where 0.0 ≤ x ≤ 1.0
public func saturate<T:BinaryFloatingPoint>(_ x: T) -> T {
    return clamp(x, min: 0.0, max: 1.0)
}

/// Performs a linear interpolation between a and b by the interpolant t
///
/// - parameter a: start value
/// - parameter b: end value
/// - parameter t: interpolant
///
/// - returns: a value interpolated from a to b
public func interpolate<T:BinaryFloatingPoint>(_ a: T, to b: T, factor t: T) -> T {
    return a + (b - a) * t
}

/// Maps a value from a start range to an end range
///
/// - parameter value: the value to map, within the range startMin...startMax.
/// - parameter startMin: the minimum value to map from
/// - parameter startMax: the maximum value to map from
/// - parameter endMin: the minimum value to map to
/// - parameter endMax: the maximum value to map to
///
/// - returns: a value within the range endMin...endMax
public func map<T: FloatingPoint>(_ value: T, start startMin: T, _ startMax: T, end endMin: T, _ endMax: T) -> T{
    let startRange = startMax - startMin
    let endRange = endMax - endMin
    return ((value - startMin) / startRange) * endRange + endMin
}
