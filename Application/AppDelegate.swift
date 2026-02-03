//
//  Untitled.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 02. 03..
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    var appController: AppController?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Log.debug("didFinishLaunching")
        return true
    }

    // Example: push registration callback
    func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
//        appController?.didRegisterForPush(deviceToken: deviceToken)
    }
    
    // Push, background tasks, deep links go here
}
