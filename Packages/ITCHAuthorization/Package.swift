// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHAuthorization",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHAuthorization",
            targets: ["ITCHAuthorization"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHCore"),
        .package(path: "Package/ITCHControllers")
    ],
    targets: [
        .target(
            name: "ITCHAuthorization",
            dependencies: [
                "ITCHCore",
                "ITCHControllers"
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
