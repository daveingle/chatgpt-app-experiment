// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

enum Feature: String {
  case ChromaPreview
}

let package = Package(
    name: "Features",
    platforms: [
      .iOS(.v17),
      .watchOS(.v10),
      .visionOS(.v1),
      .macOS(.v15),
    ],
    products: [
      Feature.ChromaPreview.product
    ],
    targets: [
      Feature.ChromaPreview.target,
      Feature.ChromaPreview.testTarget
    ]
)

fileprivate extension Feature {
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
