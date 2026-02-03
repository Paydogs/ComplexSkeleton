//
//  ComplexSkeletonApp.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 01. 31..
//

import SwiftUI

@main
struct TrainingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    private let appController: AppController

    init() {
        // Toolkit (OSLog) logger
//        Log.install(ToolkitLoggerAdapter())
        // Apple logger
         AppleLoggerAdapter.bootstrapStandardOutputWithLogLevel(level: .trace)
         Log.install(AppleLoggerAdapter())
        Log.debug("Logging initialized")
        
        appController = AppController()
        appDelegate.appController = appController
    }
    
    var body: some Scene {
        WindowGroup {
            appController.getRootView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active: Log.debug("App become Active")
                case .inactive: Log.debug("App become nactive")
                case .background: Log.debug("App become Background")
                @unknown default: break
            }
        }
    }
}

