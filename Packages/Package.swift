// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
      .iOS(.v17),
      .watchOS(.v10),
      .visionOS(.v1),
      .macOS(.v15),
    ],
    products: [
      .library(
      name: "PrompCraft",
      targets: ["PrompCraft"])
    ],
    dependencies: [
      .package(name: "Features", path: "./Features"),
      .package(name: "Services", path: "./Services"),
    ],
    targets: [
      .target(
        name: "PrompCraft",
        dependencies: [
          .product(name: "ChromaPreview", package: "Features"),
          .product(name: "EchoBlendKit", package: "Services"),
          .product(name: "EmotionClassifier", package: "Services"),
          .product(name: "HapticPaletteKit", package: "Services"),
        ],
        path: "PrompCraft/Sources"
      ),


    ]
)
