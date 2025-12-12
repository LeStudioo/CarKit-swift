// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v17)],
    products: [
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
        
        .package(url: "https://github.com/theosementa/ToastBannerKit.git", exact: "1.0.1")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Vehicle",
                
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Models", package: "Models"),
                .product(name: "Stores", package: "Stores"),
                .product(name: "Navigation", package: "Navigation")
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
                .product(name: "ToastBannerKit", package: "ToastBannerKit")
            ]
        )
    ]
)
