// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cattus",
    /// 支持的平台和版本
    platforms: [.iOS(.v13)],
    products: [
        /// 产品定义了由包制作的可执行文件和库，并使它们能够在其他包中显现。
        .library(
            name: "Cattus",
            targets: ["Cattus"]),
    ],
    /// 依赖其他 Swift Package Manager
    dependencies: [
        /// .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Cattus",
            dependencies: []),  /// 导入依赖
        .testTarget(
            name: "CattusTests",
            dependencies: ["Cattus"]),
    ]
)
