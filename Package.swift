// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "GraphMermaid",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "GraphMermaid",
            targets: ["GraphMermaid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfBase.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/FlyingLogic/Graph.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "GraphMermaid",
            dependencies: ["Graph", "WolfBase"]),
        .testTarget(
            name: "GraphMermaidTests",
            dependencies: ["GraphMermaid"]),
    ]
)
