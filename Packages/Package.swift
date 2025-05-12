// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [.iOS(.v16)],
    products: [
      .library(
      name: "PrompCraft",
      targets: ["PrompCraft"])
    ],
    targets: [
      .target(
        name: "PrompCraft",
        dependencies: [],
        path: "PrompCraft/Sources"
      )
    ]
)
