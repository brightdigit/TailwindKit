// swift-tools-version:6.4
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let package = Package(
  name: "TailwindKit",
  platforms: [.macOS(.v13)],
  products: [
    .library(
      name: "TailwindKit",
      targets: ["TailwindKit"]
    )
  ],
  dependencies: [
    .package(name: "Plot", path: "../../Publish/Plot")
  ],
  targets: [
    .target(
      name: "TailwindKit",
      dependencies: [
        .product(name: "Plot", package: "Plot")
      ]
    ),
    .testTarget(
      name: "TailwindKitTests",
      dependencies: ["TailwindKit"]
    )
  ]
)
