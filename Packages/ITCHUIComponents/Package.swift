// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHUIComponents",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHUIComponents",
            targets: ["ITCHUIComponents"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        .target(
            name: "ITCHUIComponents",
            exclude: [
                "../../swiftgen.yml"
            ],
            resources: [
                .process("Resources/Fonts/FontsSources")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        )
    ]
)
