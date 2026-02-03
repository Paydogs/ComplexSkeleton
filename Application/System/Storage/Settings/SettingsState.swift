//
//  SettingsState.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 01. 01..
//

public struct SettingsState: DataState {
    public var colorScheme: ColorScheme
    
    public static func initialValue() -> Self {
        .init(colorScheme: .auto)
    }
}
