// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeditoModels",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_14),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeditoModels",
            targets: ["MeditoModels"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(
            name: "MeditoModels",
            dependencies: [],
            resources: [
                .process("Resources/BackgroundSoundsContainer.json"),
                .process("Resources/MindfullPacksContainer.json"),
                .process("Resources/ShortcutsContainer.json"),
            ]),
        .testTarget(
            name: "MeditoModelsTests",
            dependencies: ["MeditoModels"]),
    ]
)
