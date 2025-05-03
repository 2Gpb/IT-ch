//
//  ITCHAboutAppPages.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

enum ITCHAboutAppPages: CaseIterable {
    case faq, privacy, evaluate
    
    var title: String {
        switch self {
        case .faq:
            return "F.A.Q."
        case .privacy:
            return "Политика конфиденциальности"
        case .evaluate:
            return "Оценить приложение"
        }
    }
}
