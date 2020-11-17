// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "AWSSDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "AWSCore", targets: ["AWSCore"]),
        .library(name: "AWSIoT", targets: ["AWSIoT"]),
        .library(name: "AWSCognitoIdentityProviderASF", targets: ["AWSCognitoIdentityProviderASF"]),
        .library(name: "AWSCognitoIdentityProvider", targets: ["AWSCognitoIdentityProvider"]),
        .library(name: "AWSCognitoAuth", targets: ["AWSCognitoAuth"]),
        .library(name: "AWSCognito", targets: ["AWSCognito"])
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "AWSCore",
                path: "AWSCore"),
        .target(name: "AWSIoT",
                dependencies: ["AWSCore"],
                path: "AWSIoT"),
        .target(name: "AWSCognitoIdentityProviderASF",
                path: "AWSCognitoIdentityProviderASF"),
        .target(name: "AWSCognitoIdentityProvider",
                dependencies: ["AWSCore", "AWSCognitoIdentityProviderASF"],
                path: "AWSCognitoIdentityProvider"),
        .target(name: "AWSCognitoAuth",
                dependencies: ["AWSCore", "AWSCognitoIdentityProviderASF"],
                path: "AWSCognitoAuth"),
        .target(name: "AWSCognito",
                dependencies: ["AWSCore"],
                path: "AWSCognito")
    ]
)
