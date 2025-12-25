// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var resources: [Resource] {
    let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"

    if isPreview {
        return [
            .process("./Resources/Assets/Assets.xcassets"),
            .process("./Resources/Assets/Colors.xcassets"),
            .process("./Resources/Assets/Icons.xcassets"),
            .process("./Resources/Assets/Illustrations.xcassets")
        ]
    } else { return [] }
}

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"])
    ],
    dependencies: [
        .package(name: "Models", path: "../Models"),
        .package(name: "Utilities", path: "../Utilities"),
        .package(url: "https://github.com/theosementa/ToastBannerKit.git", exact: "1.0.1")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "Models", package: "Models"),
                .product(name: "Utilities", package: "Utilities"),
                .product(name: "ToastBannerKit", package: "ToastBannerKit")
            ],
            resources: resources,
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        )
    ]
)
