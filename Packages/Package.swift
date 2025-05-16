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
      .package(name: "ChromaPreview", path: "./Features/ChromaPreview"),
      .package(name: "DataVault", path: "./Services/DataVault"),
      .package(name: "EchoBlendKit", path: "./Services/EchoBlendKit"),
      .package(name: "EmotionClassifier", path: "./Services/EmotionClassifier"),
      .package(name: "HapticPaletteKit", path: "./Services/HapticPaletteKit"),
    ],
    targets: [
      .target(
        name: "PrompCraft",
        dependencies: [
          .product(name: "ChromaPreview", package: "ChromaPreview"),
          .product(name: "DataVault", package: "DataVault"),
          .product(name: "EchoBlendKit", package: "EchoBlendKit"),
          .product(name: "EmotionClassifier", package: "EmotionClassifier"),
          .product(name: "HapticPaletteKit", package: "HapticPaletteKit"),
        ],
        path: "PrompCraft/Sources"
      ),


    ]
)
