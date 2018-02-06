// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "Pelican",
	products: [
		.library(name: "Pelican", targets: ["Pelican"]),
		],
	dependencies: [
		.package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.4.4")),
		.package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.3.0")),
		],
	targets: [
		.target(name: "Pelican", dependencies: ["Vapor", "FluentProvider"]),
		]
)
