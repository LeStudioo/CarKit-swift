// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Authentification", targets: ["Authentification"]),
        .library(name: "Home", targets: ["Home"]),
        .library(name: "Vehicle", targets: ["Vehicle"]),
        .library(name: "Spending", targets: ["Spending"])
    ],
    dependencies: [
        .package(name: "DesignSystem", path: "../DesignSystem"),
        .package(name: "Models", path: "../Models"),
        .package(name: "Stores", path: "../Stores"),
        .package(name: "Navigation", path: "../Navigation"),
        .package(name: "Utilities", path: "../Utilities"),
        .package(name: "Core", path: "../Core"),
        .package(name: "Preferences", path: "../Preferences"),
        
        .package(url: "https://github.com/theosementa/ToastBannerKit.git", exact: "1.0.1"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "9.0.0")
    ],
    targets: [
        .target(
            name: "Authentification",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Models", package: "Models"),
                .product(name: "Stores", package: "Stores"),
                .product(name: "Utilities", package: "Utilities"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        ),
        
        .target(
            name: "Home",
            dependencies: [
                "Vehicle",
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Models", package: "Models"),
                .product(name: "Stores", package: "Stores"),
                .product(name: "Navigation", package: "Navigation")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        ),
        
        .target(
            name: "Vehicle",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Models", package: "Models"),
                .product(name: "Stores", package: "Stores"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "ToastBannerKit", package: "ToastBannerKit")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        ),
        
        .target(
            name: "Spending",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Models", package: "Models"),
                .product(name: "Stores", package: "Stores"),
                .product(name: "Navigation", package: "Navigation"),
                .product(name: "Utilities", package: "Utilities"),
                .product(name: "Preferences", package: "Preferences"),
                .product(name: "ToastBannerKit", package: "ToastBannerKit")
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
