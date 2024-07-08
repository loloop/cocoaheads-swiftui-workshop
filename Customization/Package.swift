// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let common = Target.Dependency.product(
  name: "Common",
  package: "Common")

let package = Package(
    name: "Customization",
    platforms: [
      .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Customization",
            targets: ["Customization"]),
    ],
    dependencies: [
      .package(path: "Common")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Customization",
            dependencies: [common]),
        .testTarget(
            name: "CustomizationTests",
            dependencies: ["Customization"]),
    ]
)
