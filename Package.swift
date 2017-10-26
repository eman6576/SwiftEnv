// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftEnv",
    products: [
        .library(
            name: "SwiftEnv",
            targets: ["SwiftEnv"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftEnv",
            dependencies: ["SwiftEnv-C"],
            path: "./Sources/SwiftEnv/"),
        .target(
            name: "SwiftEnv-C",
            dependencies: [],
            path: "./Sources/SwiftEnv-C/"
        ),
        .testTarget(
            name: "SwiftEnvTests",
            dependencies: ["SwiftEnv"]),
    ]
)
