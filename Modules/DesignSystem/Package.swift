// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "Models", package: "Models")
            ],
            resources: [
                .process("./Resources/Assets/Assets.xcassets"),
                .process("./Resources/Assets/Colors.xcassets"),
                .process("./Resources/Assets/Icons.xcassets")
            ]
        )
    ]
)
