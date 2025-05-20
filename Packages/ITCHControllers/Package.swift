// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ITCHControllers",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ITCHControllers",
            targets: ["ITCHControllers"]
        )
    ],
    dependencies: [
        .package(path: "Packages/ITCHCore"),
        .package(path: "Packages/ITCHCourses"),
        .package(path: "Packages/ITCHSchedule"),
        .package(path: "Packages/ITCHNotifications"),
        .package(path: "Packages/ITCHProfile")
    ],
    targets: [
        .target(
            name: "ITCHControllers",
            dependencies: [
                "ITCHCore",
                "ITCHCourses",
                "ITCHSchedule",
                "ITCHNotifications",
                "ITCHProfile"
            ]
        )
    ]
)
