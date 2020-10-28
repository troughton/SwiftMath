// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftMath",
    products: [
        .library(name: "SwiftMath", targets: ["SwiftMath"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "0.0.6")
    ],
    targets: [
        .target(name: "SwiftMath", dependencies: ["RealModule"]),
        .testTarget(name: "SwiftMathTests", dependencies: ["SwiftMath", "RealModule"]),
    ]
)
