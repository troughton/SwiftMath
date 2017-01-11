//
//  Vector.swift
//  SwiftMath
//
//  Created by Thomas Roughton on 11/01/17.
//
//

import Swift

public protocol Vector : Equatable {
    static var zero : Self { get }
    
    var isZero: Bool { get }
    
    init(_ value: Float)
    
    var lengthSquared: Float { get }
    
    var length: Float { get }
    
    func dot(_ v: Self) -> Float
    
    var normalized: Self { get }
    
    func interpolated(to v: Self, factor t: Float) -> Self
    
    static prefix func -(v: Self) -> Self
    
    static func +=(lhs: inout Self, rhs: Self)
    static func -=(lhs: inout Self, rhs: Self)
    static func *=(lhs: inout Self, rhs: Self)
    static func /=(lhs: inout Self, rhs: Self)
    
    static func *=(lhs: inout Self, rhs: Float)
    static func /=(lhs: inout Self, rhs: Float)

}

public extension Vector {
    public static func +(lhs: Self, rhs: Self) -> Self {
        var result = lhs
        result += rhs
        return result
    }
    
    public static func -(lhs: Self, rhs: Self) -> Self {
        var result = lhs
        result -= rhs
        return result
    }
    
    public static func *(lhs: Self, rhs: Self) -> Self {
        var result = lhs
        result *= rhs
        return result
    }
    
    public static func *(lhs: Self, rhs: Float) -> Self {
        var result = lhs
        result *= rhs
        return result
    }
    
    public static func /(lhs: Self, rhs: Self) -> Self {
        var result = lhs
        result /= rhs
        return result
    }
    
    public static func /(lhs: Self, rhs: Float) -> Self {
        var result = lhs
        result /= rhs
        return result
    }
}
