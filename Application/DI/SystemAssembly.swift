//
//  SystemAssembly.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 02. 03..
//

import Swinject
import Toolkit

final class SystemAssembly: Assembly {
    func assemble(container: Container) {
        registerStores(to: container)
        registerUtils(to: container)
        registerScreens(to: container)
    }

    func registerStores(to container: Container) {
        
    }

    func registerUtils(to container: Container) {

    }
    
    func registerScreens(to container: Container) {

    }
}
