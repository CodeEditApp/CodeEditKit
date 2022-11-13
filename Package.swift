// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "CodeEditKit",
    products: [
        .library(
            name: "CodeEditKit",
            type: .dynamic,
            targets: ["CodeEditKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CodeEditKit",
            dependencies: []),
        .testTarget(
            name: "CodeEditKitTests",
            dependencies: ["CodeEditKit"]),
    ]
)
