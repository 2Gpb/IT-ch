// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHSchedule",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHSchedule",
            targets: ["ITCHSchedule"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHUIComponents")
    ],
    targets: [
        .target(
            name: "ITCHSchedule",
            dependencies: [
                "ITCHUIComponents"
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
