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
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CodeEditKit",
            dependencies: []),
        .testTarget(
            name: "CodeEditKitTests",
            dependencies: ["CodeEditKit"]),
    ]
)
