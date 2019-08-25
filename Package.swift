// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftMath",
    products: [
        .library(name: "SwiftMath", targets: ["SwiftMath"]),
    ],
    targets: [
        .target(name: "SwiftMath")
    ]
)
