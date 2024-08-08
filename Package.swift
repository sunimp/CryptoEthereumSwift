// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoEthereumSwift",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CryptoEthereumSwift",
            targets: ["CryptoEthereumSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.3"),
        .package(url: "https://github.com/21-DOT-DEV/swift-secp256k1.git", from: "0.17.0"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "3.3.1000")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CryptoEthereumSwift",
            dependencies: [
                "CryptoSwift",
                .product(name: "secp256k1", package: "swift-secp256k1"),
                "OpenSSL",
                "CryptoEthereumSwiftInternal"
            ]
        ),
        .target(
            name: "CryptoEthereumSwiftInternal",
            dependencies: ["OpenSSL"]
        ),
        .testTarget(
            name: "CryptoEthereumSwiftTests",
            dependencies: ["CryptoEthereumSwift"]),
    ]
)
