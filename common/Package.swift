// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonModels",
    products: [
        .library(
            name: "CommonModels",
            targets: ["CommonModels"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CommonModels",
            dependencies: []),
    ]
)
