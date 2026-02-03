//
//  AppComposition.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 02. 03..
//

import Swinject

enum AppComposition {
    static func composeAssembler() -> Assembler {
        Assembler(assemblies())
    }
    
    private static func assemblies() -> [Assembly] {
        [
            SystemAssembly()
        ]
    }
}
