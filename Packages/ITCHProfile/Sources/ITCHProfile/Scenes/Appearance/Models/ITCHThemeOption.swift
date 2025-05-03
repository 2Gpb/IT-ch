//
//  ITCHThemeOption.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

enum ITCHThemeOption: CaseIterable {
    case system, light, dark

    var title: String {
        switch self {
        case .system: 
            return "Системная"
        case .light: 
            return "Светлая"
        case .dark: 
            return "Тёмная"
        }
    }
}
