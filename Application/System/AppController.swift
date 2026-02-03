//
//  AppController.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 02. 03..
//

import SwiftUI
import Swinject

class AppController {
    private let resolver: Resolver
    
    init() {
        self.resolver = AppComposition.composeAssembler().resolver
    }
    
    func getRootView() -> some View {
//        rootCoordinator.rootView
        EmptyView()
    }
}

extension AppController: ColorSchemeHandler {
    func setColorScheme(_ scheme: ColorScheme) {
//        switch scheme {
//        case .light:
//            window?.overrideUserInterfaceStyle = .light
//        case .dark:
//            window?.overrideUserInterfaceStyle = .dark
//        case .auto:
//            window?.overrideUserInterfaceStyle = .unspecified
//        }
    }
}
