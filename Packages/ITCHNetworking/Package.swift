// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHNetworking",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHNetworking",
            targets: ["ITCHNetworking"]
        )
    ],
    targets: [
        .target(
            name: "ITCHNetworking"
        )
    ]
    ,
    swiftLanguageModes: [.v5]
)
