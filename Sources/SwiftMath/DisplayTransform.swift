//
//  DisplayTransform.swift
//  SwiftMath
//
//  Created by Thomas Roughton on 6/03/20.
//

/// A transform that can only scale and offset in 2D.
/// Composes from right to left – i.e. (A * B * C * v) is applied as first transforming v by C, then by B, and then by A.
public struct DisplayTransform<Scalar: SIMDScalar & BinaryFloatingPoint>: Hashable, Codable {
    public var scale: SIMD2<Scalar>
    public var offset: SIMD2<Scalar>
    
    @inlinable
    public init(scale: SIMD2<Scalar>, offset: SIMD2<Scalar> = .zero) {
        self.scale = scale
        self.offset = offset
    }
    
    @inlinable
    public init<T>(_ transform: DisplayTransform<T>) {
        self.scale = SIMD2(transform.scale)
        self.offset = SIMD2(transform.offset)
    }
    
    @inlinable
    public init(fitting imageSize: SIMD2<Scalar>, in windowSize: SIMD2<Scalar>) {
        self.offset = .zero
        
        let ratio = windowSize / imageSize
        let sizeToFit = min(ratio.x, ratio.y)
        self.scale = sizeToFit / windowSize
    }
    
    @inlinable
    public var inverse: DisplayTransform {
        // Forward transform: b = a * scale + offset
        // Inverse transform: (b - offset) / scale = a
        let invScale = 1.0 / self.scale
        return DisplayTransform(scale: invScale, offset: -self.offset * invScale)
    }

    @inlinable
    public static var identity: DisplayTransform {
        return DisplayTransform(scale: .one, offset: .zero)
    }
    
    @inlinable
    public static var uvToNDC: DisplayTransform {
        return DisplayTransform(scale: SIMD2<Scalar>(2.0, -2.0), offset: SIMD2<Scalar>(-1.0, 1.0))
    }
    
    @inlinable
    public static var ndcToUV: DisplayTransform {
        return DisplayTransform(scale: SIMD2<Scalar>(0.5, -0.5), offset: SIMD2<Scalar>(repeating: 0.5))
    }
    
    @inlinable
    public static func *(lhs: DisplayTransform, rhs: DisplayTransform) -> DisplayTransform {
        return DisplayTransform(scale: lhs.scale * rhs.scale, offset: lhs.offset.addingProduct(lhs.scale, rhs.offset))
    }
    
    @inlinable
    public static func *(lhs: DisplayTransform, rhs: SIMD2<Scalar>) -> SIMD2<Scalar> {
        return lhs.offset.addingProduct(lhs.scale, rhs)
    }

    @inlinable
    public static func *(lhs: DisplayTransform, rhs: AffineMatrix<Scalar>) -> AffineMatrix<Scalar> {
        return AffineMatrix(lhs) * rhs
    }
    
    @inlinable
    public static func *(lhs: DisplayTransform, rhs: Matrix4x4<Scalar>) -> Matrix4x4<Scalar> {
        return Matrix4x4(lhs) * rhs
    }
}

extension DisplayTransform: Equatable {}

extension AffineMatrix {
    @inlinable
    public init(_ transform: DisplayTransform<Scalar>) {
        self.init(rows: SIMD4(transform.scale.x, 0, 0, transform.offset.x),
                        SIMD4(0, transform.scale.y, 0, transform.offset.y),
                        SIMD4(0, 0, 1, 0)
                  )
    }
}

extension Matrix4x4 {
    @inlinable
    public init(_ transform: DisplayTransform<Scalar>) {
        self.init(SIMD4(transform.scale.x, 0, 0, 0),
                  SIMD4(0, transform.scale.y, 0, 0),
                  SIMD4(0, 0, 1, 0),
                  SIMD4(transform.offset.x, transform.offset.y, 0, 1)
                  )
    }
}


// MARK: - Rect Conversion

extension DisplayTransform {
    @inlinable
    public static func croppedUVToUncroppedPixel(cropRect: Rect<Scalar>) -> DisplayTransform<Scalar> {
        return DisplayTransform(scale: cropRect.size, offset: cropRect.origin)
    }
    
    @inlinable
    public static func uncroppedPixelToCroppedUV(cropRect: Rect<Scalar>) -> DisplayTransform<Scalar> {
        return self.croppedUVToUncroppedPixel(cropRect: cropRect).inverse
    }
    
    @inlinable
    public static func croppedUVToUncroppedUV(cropRect: Rect<Scalar>, uncroppedSize: SIMD2<Scalar>) -> DisplayTransform<Scalar> {
        return DisplayTransform(scale: SIMD2<Scalar>(uncroppedSize)).inverse * DisplayTransform.croppedUVToUncroppedPixel(cropRect: cropRect)
    }
    
    @inlinable
    public static func uncroppedUVToCroppedUV(cropRect: Rect<Scalar>, uncroppedSize: SIMD2<Scalar>) -> DisplayTransform<Scalar> {
        return DisplayTransform.croppedUVToUncroppedPixel(cropRect: cropRect).inverse * DisplayTransform(scale: SIMD2<Scalar>(uncroppedSize))
    }
}

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)

import CoreGraphics

extension DisplayTransform {
    @inlinable
    public static func croppedUVToUncroppedPixel(cropRect: CGRect) -> DisplayTransform<Scalar> {
        return DisplayTransform(scale: SIMD2<Scalar>(SIMD2(Scalar(cropRect.width), Scalar(cropRect.height))), offset: SIMD2<Scalar>(SIMD2(Scalar(cropRect.origin.x), Scalar(cropRect.origin.y))))
    }
    
    @inlinable
    public static func uncroppedPixelToCroppedUV(cropRect: CGRect) -> DisplayTransform<Scalar> {
        return self.croppedUVToUncroppedPixel(cropRect: cropRect).inverse
    }
    
    @inlinable
    public static func croppedUVToUncroppedUV(cropRect: CGRect, uncroppedSize: CGSize) -> DisplayTransform<Scalar> {
        return DisplayTransform(scale: SIMD2<Scalar>(Scalar(uncroppedSize.width), Scalar(uncroppedSize.height))).inverse * DisplayTransform.croppedUVToUncroppedPixel(cropRect: cropRect)
    }
    
    @inlinable
    public static func uncroppedUVToCroppedUV(cropRect: CGRect, uncroppedSize: CGSize) -> DisplayTransform<Scalar> {
        return DisplayTransform.croppedUVToUncroppedPixel(cropRect: cropRect).inverse * DisplayTransform(scale: SIMD2<Scalar>(Scalar(uncroppedSize.width), Scalar(uncroppedSize.height)))
    }
}

#endif