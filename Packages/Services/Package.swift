// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Service: String {
  case DataVault
  case EchoBlendKit
  case EmotionClassifier
  case HapticPaletteKit
}

let package = Package(
  name: "Services",
  platforms: [
    .iOS(.v17),
    .watchOS(.v10),
    .visionOS(.v1),
    .macOS(.v15),
  ],
  products: [
    Service.DataVault.product,
    Service.EchoBlendKit.product,
    Service.EmotionClassifier.product,
    Service.HapticPaletteKit.product,
  ],
  targets: [
    Service.DataVault.target,
    Service.DataVault.testTarget,
    Service.EchoBlendKit.target,
    Service.EchoBlendKit.testTarget,
    Service.EmotionClassifier.target,
    Service.EmotionClassifier.testTarget,
    Service.HapticPaletteKit.target,
    Service.HapticPaletteKit.testTarget,
  ]
)

fileprivate extension Service {
  enum Target: String {
    case Source
    case Tests
  }
  
  var product: PackageDescription.Product {
    self()
  }

  var target: PackageDescription.Target {
    self(.Source)
  }

  var testTarget: PackageDescription.Target {
    self(.Tests)
  }

  private func callAsFunction() -> PackageDescription.Product {
    .library(name: rawValue, targets: [rawValue])
  }

  private func callAsFunction(_ target: Target) -> PackageDescription.Target {
    switch target {
    case .Source:
        .target(
          name: rawValue,
          path: rawValue + "/Sources"
        )
    case .Tests:
        .testTarget(
          name: rawValue + "Tests",
          dependencies: [
            .target(name: rawValue)
          ],
          path: rawValue + "/Tests"
        )
    }
  }
}
