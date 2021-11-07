// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "primer-swiftui",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "primer-swiftui",
            targets: ["primer-swiftui"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Iron-Ham/Octicons.swift", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "primer-swiftui",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                .product(name: "Octicons.swift", package: "Octicons.swift"),
            ]),
        .testTarget(
            name: "primer-swiftuiTests",
            dependencies: ["primer-swiftui"]),
    ]
)
