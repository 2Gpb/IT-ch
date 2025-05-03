// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHProfile",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHProfile",
            targets: ["ITCHProfile"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHCore")
    ],
    targets: [
        .target(
            name: "ITCHProfile",
            dependencies: [
                "ITCHCore"
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
