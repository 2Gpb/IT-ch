// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHCore",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHCore",
            targets: ["ITCHCore"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHUIComponents"),
        .package(path: "Packages/ITCHNetworking")
    ],
    targets: [
        .target(
            name: "ITCHCore",
            dependencies: [
                "ITCHUIComponents",
                "ITCHNetworking"
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
