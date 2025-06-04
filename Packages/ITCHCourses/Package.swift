// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHCourses",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHCourses",
            targets: ["ITCHCourses"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHCore"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager", from: "8.0.1"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardToolbarManager", from: "1.0.10")
    ],
    targets: [
        .target(
            name: "ITCHCourses",
            dependencies: [
                "ITCHCore"
            ]
        ),
        .testTarget(
            name: "ITCHCoursesTests",
            dependencies: [
                "ITCHCore",
                "ITCHCourses",
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                .product(name: "IQKeyboardToolbarManager", package: "IQKeyboardToolbarManager")
            ],
            path: "Sources/ITCHCoursesTests"
        )
    ],
    swiftLanguageModes: [.v5]
)
