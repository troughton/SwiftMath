// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftMath",
    products: [
        .library(name: "SwiftMath", targets: ["SwiftMath"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: Version(0, 0, 3))
    ],
    targets: [
        .target(name: "SwiftMath", dependencies: ["Real"])
    ]
)
