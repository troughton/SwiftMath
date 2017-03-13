//
//  Primitives.swift
//  InterdimensionalLlama
//
//  Created by Thomas Roughton on 18/11/16.
//
//

import Swift

public struct AxisAlignedBoundingBox {
    public var minPoint : Vector3f
    public var maxPoint : Vector3f
    
    public init(min: Vector3f, max: Vector3f) {
        self.minPoint = min
        self.maxPoint = max
    }
    
    public mutating func expand(by factor: Float) {
        self.minPoint -= Vector3f(factor)
        self.maxPoint += Vector3f(factor)
    }
    
    public static let baseBox = AxisAlignedBoundingBox(min: vec3(Float.infinity), max: vec3(-Float.infinity))
    
    public var width : Float {
        return self.maxX - self.minX;
    }
    
    public var depth : Float {
        return self.maxZ - self.minZ;
    }
    
    public var height : Float {
        return self.maxY - self.minY;
    }
    
    public var volume : Float {
        return self.depth * self.width * self.height;
    }
    
    public var minX : Float { return self.minPoint.x }
    public var minY : Float { return self.minPoint.y }
    public var minZ : Float { return self.minPoint.z }
    public var maxX : Float { return self.maxPoint.x }
    public var maxY : Float { return self.maxPoint.y }
    public var maxZ : Float { return self.maxPoint.z }
    
    
    public var centreX : Float {
        return (self.minX + self.maxX)/2;
    }
    
    public var centreY : Float {
        return (self.minY + self.maxY)/2;
    }
    
    public var centreZ : Float {
        return (self.minZ + self.maxZ)/2
    }
    
    public var centre : vec3 {
        return vec3(self.centreX, self.centreY, self.centreZ);
    }
    
    public var size : vec3 {
        return self.maxPoint - self.minPoint
    }
    
    public func containsPoint(_ point: vec3) -> Bool {
        return point.x >= self.minX &&
            point.x <= self.maxX &&
            point.y >= self.minY &&
            point.y <= self.maxY &&
            point.z >= self.minZ &&
            point.z <= self.maxZ;
    }
    
    /**
     * Returns the vertex of self box in the direction described by direction.
     * @param direction The direction to look in.
     * @return The vertex in that direction.
     */
    public func pointAtExtent(_ extent: Extent) -> vec3 {
        let useMaxX = extent.rawValue & Extent.MaxXFlag != 0
        let useMaxY = extent.rawValue & Extent.MaxYFlag != 0
        let useMaxZ = extent.rawValue & Extent.MaxZFlag != 0
        
        return vec3(useMaxX ? self.maxX : self.minX, useMaxY ? self.maxY : self.minY, useMaxZ ? self.maxZ : self.minZ)
    }
    
    /**
     * @param otherBox The box to check intersection with.
     * @return Whether self box is intersecting with the other box.
     */
    public func intersectsWith(_ otherBox: AxisAlignedBoundingBox) -> Bool {
        return !(self.maxX < otherBox.minX ||
            self.minX > otherBox.maxX ||
            self.maxY < otherBox.minY ||
            self.minY > otherBox.maxY ||
            self.maxZ < otherBox.minZ ||
            self.minZ > otherBox.maxZ);
    }
    
    public func contains(_ otherBox: AxisAlignedBoundingBox) -> Bool {
        return
            self.minX < otherBox.minX &&
                self.maxX > otherBox.maxX &&
                self.minY < otherBox.minY &&
                self.maxY > otherBox.maxY &&
                self.minZ < otherBox.minZ &&
                self.maxZ > otherBox.maxZ
    }
    
    public static func combine(_ a : AxisAlignedBoundingBox, _ b : AxisAlignedBoundingBox) -> AxisAlignedBoundingBox {
        return AxisAlignedBoundingBox(min: min(a.minPoint, b.minPoint), max: max(a.maxPoint, b.maxPoint))
    }
    
    
    /**
     * Transforms this bounding box from its local space to the space described by nodeToSpaceTransform.
     * The result is guaranteed to be axis aligned – that is, with no rotation in the destination space.
     * It may or may not have the same width, height, or depth as its source.
     * @param nodeToSpaceTransform The transformation from local to the destination space.
     * @return this box in the destination coordinate system.
     */
    public func toSpace(nodeToSpaceTransform : Matrix4x4f) -> AxisAlignedBoundingBox {
        
        var minX = Float.infinity, minY = Float.infinity, minZ = Float.infinity
        var maxX = -Float.infinity, maxY = -Float.infinity, maxZ = -Float.infinity
        
        //Compute all the vertices for the box.
        for xToggle in 0..<2 {
            for yToggle in 0..<2 {
                for zToggle in 0..<2 {
                    let x = xToggle == 0 ? minPoint.x : maxPoint.x;
                    let y = yToggle == 0 ? minPoint.y : maxPoint.y;
                    let z = zToggle == 0 ? minPoint.z : maxPoint.z;
                    let vertex = vec3(x, y, z);
                    let transformedVertex = nodeToSpaceTransform * Vector4f(vertex, 1);
                    
                    if (transformedVertex.x < minX) { minX = transformedVertex.x; }
                    if (transformedVertex.y < minY) { minY = transformedVertex.y; }
                    if (transformedVertex.z < minZ) { minZ = transformedVertex.z; }
                    if (transformedVertex.x > maxX) { maxX = transformedVertex.x; }
                    if (transformedVertex.y > maxY) { maxY = transformedVertex.y; }
                    if (transformedVertex.z > maxZ) { maxZ = transformedVertex.z; }
                }
            }
        }
        
        return AxisAlignedBoundingBox(min: vec3(minX, minY, minZ), max: vec3(maxX, maxY, maxZ));
    }
    
    public func maxZForBoundingBoxInSpace(nodeToSpaceTransform : Matrix4x4f) -> Float {
        
        var maxZ = -Float.infinity
        
        //Compute all the vertices for the box.
        for xToggle in 0..<2 {
            for yToggle in 0..<2 {
                for zToggle in 0..<2 {
                    let x = xToggle == 0 ? minPoint.x : maxPoint.x;
                    let y = yToggle == 0 ? minPoint.y : maxPoint.y;
                    let z = zToggle == 0 ? minPoint.z : maxPoint.z;
                    let vertex = vec3(x, y, z);
                    let transformedVertex = nodeToSpaceTransform * Vector4f(vertex, 1);
                    
                    if (transformedVertex.z > maxZ) { maxZ = transformedVertex.z; }
                }
            }
        }
        
        return maxZ;
    }

}

public struct Cylinder {
    public var position : Vector3f
    public var end : Vector3f
    public var radius : Float
    
}

public struct Disk {
    public var centre : Vector3f
    public var normal : Vector3f
    public var radius : Float
    
}

public struct OrientedBoundingBox {
    public var transform : Matrix4x4f
    
    public init(transform: Matrix4x4f = Matrix4x4f.identity) {
        self.transform = transform
    }
}

public struct Plane {
    public var normal : Vector3f
    public var distance : Float
}

public struct Ray {
    
    public var origin : Vector3f
    public var direction : Vector3f
    
    public init(origin: Vector3f = Vector3f(0), direction: Vector3f = Vector3f(0)) {
        self.origin = origin
        self.direction = direction
    }
    
    public init(fromScreenSpaceX x: Float, y: Float, mvp: Matrix4x4f) {
        self = Ray(fromScreenSpaceX: x, y: y, inverseMVP: mvp.inversed)
    }
    
    public init(fromScreenSpaceX x: Float, y: Float, inverseMVP: Matrix4x4f) {
        let ray = Ray(origin: Vector3f(x, y, 0), direction: Vector3f(0, 0, 1))
        let viewRay = inverseMVP * ray
        self = viewRay
    }
    
    public func at(t: Float) -> Vector3f {
        return self.origin + Vector3f(t) * self.direction
    }
    
    public static func *(lhs: Matrix4x4f, rhs: Ray) -> Ray {
        var ray = Ray()
        
        let origin = lhs * Vector4f(rhs.origin, 1)
        
        ray.origin = origin.xyz * Vector3f(1.0 / origin.w)
        
        let direction = Vector3f(
            lhs[2][0] - (lhs[2][3] * ray.origin.x),
            lhs[2][1] - (lhs[2][3] * ray.origin.y),
            lhs[2][2] - (lhs[2][3] * ray.origin.z)
            ).normalized
        ray.direction = direction
        return ray
    }
    
    public func intersectionAt(y: Float) -> Vector3f {
        let t = (y - self.origin.y) / self.direction.y
        return self.at(t: t)
    }
}

public struct Sphere {
    public var centre : Vector3f
    public var radius : Float
}

public struct Triangle {
    public var v0 : Vector3f
    public var v1 : Vector3f
    public var v2 : Vector3f
}

public struct Intersection {
    public var position : Vector3f
    public var normal : Vector3f
    public var distance : Float
}
