// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHNotifications",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHNotifications",
            targets: ["ITCHNotifications"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHUIComponents")
    ],
    targets: [
        .target(
            name: "ITCHNotifications",
            dependencies: [
                "ITCHUIComponents"
            ]
        )
    ]
)
