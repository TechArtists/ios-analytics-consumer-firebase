/*
MIT License

Copyright (c) 2025 Tech Artists Agency

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "FirebaseAnalyticsAdaptor",
    platforms: [.iOS(.v15), .macOS(.v10_13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FirebaseAnalyticsAdaptor",
            targets: ["FirebaseAnalyticsAdaptor"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "11.0.0")),
        .package(url: "https://github.com/TechArtists/ios-analytics.git", from: "0.9.6")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FirebaseAnalyticsAdaptor",
            dependencies: [
                .product(name:"FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name:"FirebaseCrashlytics", package: "firebase-ios-sdk"),
                .product(name:"TAAnalytics", package:"ios-analytics")
            ]
        ),
        .testTarget(
            name: "FirebaseAnalyticsAdaptorTests",
            dependencies: ["FirebaseAnalyticsAdaptor"]
        )
    ]
)
