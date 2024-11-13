// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Base58",
    products: [
        .library(
            name: "Base58",
            targets: ["Base58"]),
    ],
    targets: [
        .target(
            name: "Base58"),
        .testTarget(
            name: "Base58Tests",
            dependencies: ["Base58"]
        ),
    ]
)
