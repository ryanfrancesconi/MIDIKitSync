// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MIDIKitSync",

    platforms: [
        .macOS(.v10_12), .iOS(.v10),
    ],

    products: [
        .library(
            name: "MIDIKitSync",
            type: .static,
            targets: ["MIDIKitSync"]
        ),
    ],

    dependencies: [
        .package(url: "https://github.com/orchetect/MIDIKit", .branch("dev")), // from: "0.1.6"),
        .package(url: "https://github.com/orchetect/TimecodeKit", from: "1.1.4"),
        .package(url: "https://github.com/orchetect/OTCore", from: "1.1.8")
    ],

    targets: [
        .target(
            name: "MIDIKitSync",
            dependencies: [
                .product(name: "MIDIKit", package: "MIDIKit"),
                .product(name: "TimecodeKit", package: "TimecodeKit")
            ]
        ),

        .testTarget(
            name: "MIDIKitSyncTests",
            dependencies: [
                .target(name: "MIDIKitSync"),
                .product(name: "TimecodeKit", package: "TimecodeKit"),
                .product(name: "OTCore-Testing-XCTest", package: "OTCore"),
            ]
        )
    ]
)