// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "GraphMermaid",
    products: [
        .library(
            name: "GraphMermaid",
            targets: ["GraphMermaid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/WolfBase.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/WolfMcNally/Graph.git", .upToNextMajor(from: "1.0.0"))
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
