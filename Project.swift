@preconcurrency import ProjectDescription

// 1. The Main App Target
let defaultApp = Target.target(
    name: "ComplexSkeleton",
    destinations: [.iPhone],
    product: .app,
    bundleId: "com.magnificat.ComplexSkeleton",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .extendingDefault(
        with: [
            "UILaunchScreen": [
                "UIColorName": "",
                "UIImageName": "",
            ],
        ]
    ),
    sources: [
        .glob("Application/**/*.swift", excluding: ["Application/Tests/**"])
    ],
    resources: ["Application/Resources/**"],
    dependencies: [
        .external(name: "Alamofire"),
        .external(name: "Lottie"),
        .external(name: "Toolkit"),
        .external(name: "Swinject"),
        .external(name: "Logging")
    ]
)

// 2. The Unit Test Target (XCTest / Swift Testing)
let unitTests = Target.target(
    name: "ComplexSkeletonTests",
    destinations: [.iPhone],
    product: .unitTests,
    bundleId: "com.magnificat.ComplexSkeletonTests",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .default,
    sources: ["Application/Tests/UnitTests/**"],
    dependencies: [
        .target(name: "ComplexSkeleton") // Access app code via @testable import
    ]
)

// 3. The UI Test Target
let uiTests = Target.target(
    name: "ComplexSkeletonUITests",
    destinations: [.iPhone],
    product: .uiTests,
    bundleId: "com.magnificat.ComplexSkeletonUITests",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .default,
    sources: ["Application/Tests/UITests/**"],
    dependencies: [
        .target(name: "ComplexSkeleton")
    ]
)

let project = Project(
    name: "ComplexSkeleton",
    targets: [defaultApp, unitTests, uiTests], // Added targets here
    resourceSynthesizers: [
        .assets(),
        .strings()
    ]
)