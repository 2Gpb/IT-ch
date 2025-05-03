//
//  ITCHLanguageOption.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

enum ITCHLanguageOption: CaseIterable {
    case russian
    case english
    
    var title: String {
        switch self {
        case .russian:
            return "Русский"
        case .english:
            return "English"
        }
    }
}
