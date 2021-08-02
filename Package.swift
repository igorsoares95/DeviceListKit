// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeviceListKit",
    products: [
        .library(
            name: "DeviceListKit", targets: ["DeviceListKit"]),
    ],
    targets: [
        .target(
            name: "DeviceListKit",
            path: "DeviceListKit"
            exclude: ["Info.plist"])
        )
    ]
)
