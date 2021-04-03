// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppleEvents",
    platforms: [.macOS(.v10_12)],
    products: [
        .library(name: "AppleEvents", targets: ["AppleEvents"]),
        .library(name: "AEMShim", targets: ["AEMShim"]),
        .executable(name: "test-receive", targets: ["test-receive"]),
        .executable(name: "test-send", targets: ["test-send"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "AEMShim"),
        .target(
            name: "AppleEvents",
            dependencies: ["AEMShim"],
            resources: [.copy("Resources")]),
        .target(
            name: "test-receive",
            dependencies: ["AppleEvents"],
            resources: [.process("Resources")]),
        .target(
            name: "test-send",
            dependencies: ["AppleEvents"]),
    ]
)
