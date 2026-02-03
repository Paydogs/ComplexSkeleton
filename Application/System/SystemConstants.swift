//
//  SystemConstants.swift
//  ComplexSkeleton
//
//  Created by Andras Olah on 2026. 02. 03..
//

public enum LanguageCode: String, DataStateProperty {
    case en
    case hu
    
    var localizedValue: String {
        switch self {
        case .en:
            Keys.languageCodeEn
        case .hu:
            Keys.languageCodeHu
        }
    }
}

public enum ColorScheme: String, DataStateProperty {
    case light
    case dark
    case auto
    
    var localizedValue: String {
        switch self {
        case .light:
            Keys.darkModeOff
        case .dark:
            Keys.darkModeOn
        case .auto:
            Keys.darkModeAutomatic
        }
    }
}
