// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHUtilities",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHUtilities",
            targets: ["ITCHUtilities"]
        )
    ],
    targets: [
        .target(
            name: "ITCHUtilities"
        )
    ],
    swiftLanguageModes: [.v5]
)
