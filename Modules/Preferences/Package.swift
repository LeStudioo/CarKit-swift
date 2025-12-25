// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Preferences",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Preferences",
            targets: ["Preferences"]
        )
    ],
    dependencies: [
        .package(name: "Models", path: "../Models")
    ],
    targets: [
        .target(
            name: "Preferences",
            dependencies: [
                .product(name: "Models", package: "Models")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
