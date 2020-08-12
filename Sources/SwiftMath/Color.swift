//
//  Color.swift
//  LlamaCore
//
//  Created by Thomas Roughton on 30/07/18.
//

public struct RGBColor : Equatable, Hashable {
    public var r: Float
    public var g: Float
    public var b: Float
    private let a: Float = 1.0
    
    @inlinable
    public init(x: Float, y: Float, z: Float) {
        self.r = 3.240479 * x - 1.537150 * y - 0.498535 * z
        self.g = -0.969256 * x + 1.875991 * y + 0.041556 * z
        self.b = 0.055648 * x - 0.204043 * y + 1.057311 * z
    }
    
    @inlinable
    public init(r: Float, g: Float, b: Float) {
        self.r = r
        self.g = g
        self.b = b
    }
    
    @inlinable
    public init(_ r: Float, _ g: Float, _ b: Float) {
        self.r = r
        self.g = g
        self.b = b
    }
    
    @inlinable
    public init(_ rgb: SIMD3<Float>) {
        self.r = rgb.x
        self.g = rgb.y
        self.b = rgb.z
    }
    
    @inlinable
    public init(_ value: Float) {
        self.r = value
        self.g = value
        self.b = value
    }
    
    @inlinable
    public subscript(i: Int) -> Float {
        get {
            switch i {
            case 0:
                return self.r
            case 1:
                return self.g
            case 2:
                return self.b
            default:
                preconditionFailure("Index out of bounds")
            }
        }
        set {
            switch i {
            case 0:
                self.r = newValue
            case 1:
                self.g = newValue
            case 2:
                self.b = newValue
            default:
                preconditionFailure("Index out of bounds")
            }
        }
    }
    
    @inlinable
    public var luminance: Float {
        return 0.212671 * self.r + 0.715160 * self.b + 0.072169 * self.g
    }
    
    public var xyz : (x: Float, y: Float, z: Float) {
        return (
            0.412453 * self.r + 0.357580 * self.g + 0.180423 * self.b,
            0.212671 * self.r + 0.715160 * self.g + 0.072169 * self.b,
            0.019334 * self.r + 0.119193 * self.g + 0.950227 * self.b
        )
    }
    
    public var tuple : (Float, Float, Float) {
        return (
            self.r, self.g, self.b
        )
    }
}

extension SIMD3 where Scalar == Float {
    @inlinable
    public init(_ colour: RGBColor) {
        self.init(colour.r, colour.g, colour.b)
    }
}


public typealias RGBColour = RGBColor

public struct RGBAColor : Equatable, Hashable {
    
    public var r: Float
    public var g: Float
    public var b: Float
    public var a: Float
    
    //    @inlinable
    //    public init(x: Float, y: Float, z: Float) {
    //        self.r = 3.240479 * x - 1.537150 * y - 0.498535 * z
    //        self.g = -0.969256 * x + 1.875991 * y + 0.041556 * z
    //        self.b = 0.055648 * x - 0.204043 * y + 1.057311 * z
    //    }
    
    @inlinable
    public init(packed: UInt32) {
        let a = (packed >> UInt32(24)) & UInt32(0xFF)
        let b = (packed >> UInt32(16)) & UInt32(0xFF)
        let g = (packed >> UInt32(8))  & UInt32(0xFF)
        let r = packed & UInt32(0xFF)
        
        self.init(Float(r) / 255.0, Float(g) / 255.0, Float(b) / 255.0, Float(a) / 255.0)
    }
    
    @inlinable
    public init(r: Float, g: Float, b: Float, a: Float = 1.0) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    @inlinable
    public init(rgb: SIMD3<Float>, a: Float = 1.0) {
        self.r = rgb.x
        self.g = rgb.y
        self.b = rgb.z
        self.a = a
    }
    
    @inlinable
    public init(_ rgba: SIMD4<Float>) {
        self.r = rgba.x
        self.g = rgba.y
        self.b = rgba.z
        self.a = rgba.w
    }
    
    @inlinable
    public init(_ r: Float, _ g: Float, _ b: Float, _ a: Float = 1.0) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    @inlinable
    public init(_ value: Float, a: Float = 1.0) {
        self.r = value
        self.g = value
        self.b = value
        self.a = a
    }
    
    @inlinable
    public init(_ rgb: RGBColor, _ a: Float = 1.0) {
        self.r = rgb.r
        self.g = rgb.g
        self.b = rgb.b
        self.a = a
    }
    
    @inlinable
    public subscript(i: Int) -> Float {
        get {
            switch i {
            case 0:
                return self.r
            case 1:
                return self.g
            case 2:
                return self.b
            case 3:
                return self.a
            default:
                preconditionFailure("Index out of bounds")
            }
        }
        set {
            switch i {
            case 0:
                self.r = newValue
            case 1:
                self.g = newValue
            case 2:
                self.b = newValue
            case 3:
                self.a = newValue
            default:
                preconditionFailure("Index out of bounds")
            }
        }
    }
    
    @inlinable
    public var luminance: Float {
        return 0.212671 * self.r + 0.715160 * self.b + 0.072169 * self.g
    }
    
    @inlinable
    public var xyz : (x: Float, y: Float, z: Float) {
        return (
            0.412453 * self.r + 0.357580 * self.g + 0.180423 * self.b,
            0.212671 * self.r + 0.715160 * self.g + 0.072169 * self.b,
            0.019334 * self.r + 0.119193 * self.g + 0.950227 * self.b
        )
    }
    
    @inlinable
    public var rgb : RGBColor {
        get {
            return RGBColor(r: self.r, g: self.g, b: self.b)
        }
        set {
            self.r = newValue.r
            self.g = newValue.g
            self.b = newValue.b
        }
    }
    
    @inlinable
    public var packed : UInt32 {
        let w0 = clamp(self.r, min: 0, max: 1) * Float(UInt8.max)
        let w1 = clamp(self.g, min: 0, max: 1) * Float(UInt8.max)
        let w2 = clamp(self.b, min: 0, max: 1) * Float(UInt8.max)
        let w3 = clamp(self.a, min: 0, max: 1) * Float(UInt8.max)
        
        return (UInt32(w3) << 24) | (UInt32(w2) << 16) | (UInt32(w1) << 8) | UInt32(w0)
    }
}

public typealias RGBAColour = RGBAColor

extension SIMD4 where Scalar == Float {
    @inlinable
    public init(_ colour: RGBAColor) {
        self.init(colour.r, colour.g, colour.b, colour.a)
    }
}

extension RGBColor {
    @inlinable
    public static func +=(lhs: inout RGBColor, rhs: RGBColor) {
        lhs.r += rhs.r
        lhs.g += rhs.g
        lhs.b += rhs.b
    }
    
    @inlinable
    public static func +(lhs: RGBColor, rhs: RGBColor) -> RGBColor {
        var result = lhs
        result += rhs
        return result
    }
    
    @inlinable
    public static func -=(lhs: inout RGBColor, rhs: RGBColor) {
        lhs.r -= rhs.r
        lhs.g -= rhs.g
        lhs.b -= rhs.b
    }
    
    @inlinable
    public static func -(lhs: RGBColor, rhs: RGBColor) -> RGBColor {
        var result = lhs
        result -= rhs
        return result
    }
    
    @inlinable
    public static func *=(lhs: inout RGBColor, rhs: RGBColor) {
        lhs.r *= rhs.r
        lhs.g *= rhs.g
        lhs.b *= rhs.b
    }
    
    @inlinable
    public static func *(lhs: RGBColor, rhs: RGBColor) -> RGBColor {
        var result = lhs
        result *= rhs
        return result
    }
    
    @inlinable
    public static func *=(lhs: inout RGBColor, rhs: Float) {
        lhs.r *= rhs
        lhs.g *= rhs
        lhs.b *= rhs
    }
    
    @inlinable
    public static func *(lhs: RGBColor, rhs: Float) -> RGBColor {
        var result = lhs
        result *= rhs
        return result
    }
    
    @inlinable
    public static func *(lhs: Float, rhs: RGBColor) -> RGBColor {
        var result = rhs
        result *= lhs
        return result
    }
    
    @inlinable
    public static func /=(lhs: inout RGBColor, rhs: RGBColor) {
        lhs.r /= rhs.r
        lhs.g /= rhs.g
        lhs.b /= rhs.b
    }
    
    @inlinable
    public static func /(lhs: RGBColor, rhs: RGBColor) -> RGBColor {
        var result = lhs
        result /= rhs
        return result
    }
    
    @inlinable
    public static func ==(lhs: RGBColor, rhs: RGBColor) -> Bool {
        return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b
    }
}

extension RGBAColor {
    @inlinable
    public static func +=(lhs: inout RGBAColor, rhs: RGBAColor) {
        lhs.r += rhs.r
        lhs.g += rhs.g
        lhs.b += rhs.b
        lhs.a += rhs.a
    }
    
    @inlinable
    public static func +(lhs: RGBAColor, rhs: RGBAColor) -> RGBAColor {
        var result = lhs
        result += rhs
        return result
    }
    
    @inlinable
    public static func -=(lhs: inout RGBAColor, rhs: RGBAColor) {
        lhs.r -= rhs.r
        lhs.g -= rhs.g
        lhs.b -= rhs.b
        lhs.a -= rhs.a
    }
    
    @inlinable
    public static func -(lhs: RGBAColor, rhs: RGBAColor) -> RGBAColor {
        var result = lhs
        result -= rhs
        return result
    }
    
    @inlinable
    public static func *=(lhs: inout RGBAColor, rhs: RGBAColor) {
        lhs.r *= rhs.r
        lhs.g *= rhs.g
        lhs.b *= rhs.b
        lhs.a *= rhs.a
    }
    
    @inlinable
    public static func *(lhs: RGBAColor, rhs: RGBAColor) -> RGBAColor {
        var result = lhs
        result *= rhs
        return result
    }
    
    @inlinable
    public static func *=(lhs: inout RGBAColor, rhs: Float) {
        lhs.r *= rhs
        lhs.g *= rhs
        lhs.b *= rhs
        lhs.a *= rhs
    }
    
    @inlinable
    public static func *(lhs: RGBAColor, rhs: Float) -> RGBAColor {
        var result = lhs
        result *= rhs
        return result
    }
    
    @inlinable
    public static func /=(lhs: inout RGBAColor, rhs: RGBAColor) {
        lhs.r /= rhs.r
        lhs.g /= rhs.g
        lhs.b /= rhs.b
        lhs.a /= rhs.a
    }
    
    @inlinable
    public static func /(lhs: RGBAColor, rhs: RGBAColor) -> RGBAColor {
        var result = lhs
        result /= rhs
        return result
    }
    
    @inlinable
    public static func ==(lhs: RGBAColor, rhs: RGBAColor) -> Bool {
        return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b && lhs.a == rhs.a
    }
}

@inlinable
public func interpolate(from u: RGBColor, to v: RGBColor, factor t: Float) -> RGBColor {
    return u + (v - u) * t
}

@inlinable
public func interpolate(from u: RGBAColor, to v: RGBAColor, factor t: Float) -> RGBAColor {
    return u + (v - u) * t
}

@inlinable
public func min(_ a: RGBColor, _ b: RGBColor) -> RGBColor {
    return RGBColor(min(a.r, b.r), min(a.g, b.g), min(a.b, b.b))
}

@inlinable
public func max(_ a: RGBColor, _ b: RGBColor) -> RGBColor {
    return RGBColor(max(a.r, b.r), max(a.g, b.g), max(a.b, b.b))
}

@inlinable
public func clamp(_ x: RGBColor, min minVec: RGBColor, max maxVec: RGBColor) -> RGBColor {
    return min(max(minVec, x), maxVec)
}

// MARK: - Codable Conformance

extension RGBColor : Codable {
    @inlinable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(self.r)
        try container.encode(self.g)
        try container.encode(self.b)
    }
    
    @inlinable
    public init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()
        let r = try values.decode(Float.self)
        let g = try values.decode(Float.self)
        let b = try values.decode(Float.self)
        
        self.init(r: r, g: g, b: b)
    }
}


extension RGBAColor : Codable {
    @inlinable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(self.r)
        try container.encode(self.g)
        try container.encode(self.b)
        try container.encode(self.a)
    }
    
    @inlinable
    public init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()
        let r = try values.decode(Float.self)
        let g = try values.decode(Float.self)
        let b = try values.decode(Float.self)
        let a = try values.decode(Float.self)
        
        self.init(r: r, g: g, b: b, a: a)
    }
}
