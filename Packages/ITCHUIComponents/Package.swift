// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHUIComponents",
    platforms: [.iOS(
        .v16)
    ],
    products: [
        .library(
            name: "ITCHUIComponents",
            targets: ["ITCHUIComponents"]),
    ],
    targets: [
        .target(
            name: "ITCHUIComponents",
            resources: [.process(
                "Resources/Fonts/FontsSources")
            ]
        ),
    ]
)
