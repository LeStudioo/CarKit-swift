// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        )
    ],
    dependencies: [
        .package(path: "../Models"),
        .package(url: "https://github.com/theosementa/NetworkKit", branch: "1.0.1"),
        .package(url: "https://github.com/theosementa/KeychainKit", branch: "1.0.4")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "KeychainKit", package: "KeychainKit")
            ]
        )
    ]
)
