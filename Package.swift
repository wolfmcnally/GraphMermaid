// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "WolfGraphMermaid",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "WolfGraphMermaid",
            targets: ["WolfGraphMermaid"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfBase.git", .upToNextMajor(from: "4.0.0")),
        .package(path: "../WolfGraph")
    ],
    targets: [
        .target(
            name: "WolfGraphMermaid",
            dependencies: ["WolfGraph", "WolfBase"]),
        .testTarget(
            name: "WolfGraphMermaidTests",
            dependencies: ["WolfGraphMermaid"]),
    ]
)
