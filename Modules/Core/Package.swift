// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Core", targets: ["Core"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", exact: "1.10.0")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
