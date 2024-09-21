// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "GraphMermaid",
    products: [
        .library(
            name: "GraphMermaid",
            targets: ["GraphMermaid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/Graph.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "GraphMermaid",
            dependencies: ["Graph"]),
        .testTarget(
            name: "GraphMermaidTests",
            dependencies: ["GraphMermaid"]),
    ]
)
