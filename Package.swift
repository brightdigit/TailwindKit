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
  targets: [
    .target(
      name: "TailwindKit"
    ),
    .testTarget(
      name: "TailwindKitTests",
      dependencies: ["TailwindKit"]
    )
  ]
)
