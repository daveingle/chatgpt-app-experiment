// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

enum Service: String {
  case EmotionClassifier
}

let package = Package(
  name: "EmotionClassifier",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    Service.EmotionClassifier.product,
  ],
  targets: [
    Service.EmotionClassifier.target,
    Service.EmotionClassifier.testTarget,
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
          name: rawValue
        )
    case .Tests:
        .testTarget(
          name: rawValue + "Tests",
          dependencies: [
            .target(name: rawValue)
          ]
        )
    }
  }
}
