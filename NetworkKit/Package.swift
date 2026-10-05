// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS("16.4")
    ],
    products: [
        .library(name: "NetworkKit", targets: ["NetworkKit"])
    ],
    targets: [
        .target(name: "NetworkKit")
    ]
)
