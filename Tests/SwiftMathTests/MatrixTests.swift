//
//  MatrixTests.swift
//  
//
//  Created by Thomas Roughton on 8/12/19.
//

import XCTest
import Real
@testable import SwiftMath

class MatrixTests: XCTestCase {
    func testAffineMatrixVector() {
        let m = AffineMatrix<Float>.lookAtInv(eye: SIMD3(10, 10, 10), at: SIMD3<Float>(1, 1, 1))
        XCTAssertEqual(m * SIMD4(0, 0, 0, 1), SIMD4(10, 10, 10, 1))
        XCTAssertEqual(m * SIMD4(0, 0, 0, 0), SIMD4(0, 0, 0, 0))
        
        let forwardVec = SIMD4(m.forward, 0)
        XCTAssertEqual(m * SIMD4(0, 0, 1, 0), forwardVec)
        
        XCTAssertEqual((m.inverseNoScale * forwardVec).z, 1, accuracy: 0.001)
        XCTAssertEqual((m.inverse * forwardVec).z, 1, accuracy: 0.001)
    }
    
    func testAffineMatrixProduct() {
        let matrix = AffineMatrix<Float>(rows: SIMD4(1, 2, 3, 4), SIMD4(5, 6, 7, 8), SIMD4(9, 10, 11, 12))
        
        let product = matrix * matrix
        
        for column in 0..<4 {
            for row in 0..<3 {
                let targetValue = dot(matrix[row: row], matrix[column])
                XCTAssertEqual(product[row, column], targetValue)
            }
        }
    }
    
    func testMat2Product() {
        let matrix = Matrix2x2<Float>(SIMD2(1, 2), SIMD2(3, 4))
        
        let product = matrix * matrix
        
        for column in 0..<2 {
            for row in 0..<2 {
                let rowVals = SIMD2(matrix[row, 0], matrix[row, 1])
                let targetValue = dot(rowVals, matrix[column])
                XCTAssertEqual(product[row, column], targetValue)
            }
        }
    }
    
    func testMat3Product() {
        let matrix = Matrix3x3<Float>(SIMD3(1, 2, 3), SIMD3(4, 5, 6), SIMD3(7, 8, 9))
        
        let product = matrix * matrix
        
        for column in 0..<3 {
            for row in 0..<3 {
                let rowVals = SIMD3(matrix[row, 0], matrix[row, 1], matrix[row, 2])
                let targetValue = dot(rowVals, matrix[column])
                XCTAssertEqual(product[row, column], targetValue)
            }
        }
    }
    
    func testMat4Product() {
        let matrix = Matrix4x4<Float>(SIMD4(1, 2, 3, 4), SIMD4(5, 6, 7, 8), SIMD4(9, 10, 11, 12), SIMD4(13, 14, 15, 16))
        
        let product = matrix * matrix
        
        for column in 0..<4 {
            for row in 0..<4 {
                let rowVals = SIMD4(matrix[row, 0], matrix[row, 1], matrix[row, 2], matrix[row, 3])
                let targetValue = dot(rowVals, matrix[column])
                XCTAssertEqual(product[row, column], targetValue)
            }
        }
    }
    
    func testMat4Vector() {
        let matrix = Matrix4x4<Float>(SIMD4(1, 2, 3, 4), SIMD4(5, 6, 7, 8), SIMD4(9, 10, 11, 12), SIMD4(13, 14, 15, 16))
        let vector = SIMD4<Float>(5, 4, 3, 2)
        
        do {
            let product = matrix * vector
            
            for row in 0..<4 {
                let rowVals = SIMD4(matrix[row, 0], matrix[row, 1], matrix[row, 2], matrix[row, 3])
                let targetValue = dot(rowVals, vector)
                XCTAssertEqual(product[row], targetValue)
            }
        }
        
        do {
            let product = vector * matrix
            
            for column in 0..<4 {
                let targetValue = dot(matrix[column], vector)
                XCTAssertEqual(product[column], targetValue)
            }
        }
    }
}
