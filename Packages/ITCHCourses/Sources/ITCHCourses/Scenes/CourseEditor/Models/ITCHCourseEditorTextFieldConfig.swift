//
//  ITCHCourseEditorTextFieldConfig.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import ITCHUIComponents

enum ITCHCourseEditorTextFieldConfig {
    static func name() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Название",
            placeholder: "Введите название курса"
        )
    }
    
    static func location() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Место проведения",
            placeholder: "Введите место"
        )
    }
    
    static func duration() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Время курса в модулях",
            placeholder: "Выберите модули"
        )
    }
    
    static func chatLink() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Ссылка на чат",
            placeholder: "https://",
            keyboardType: .URL
        )
    }
    
    static func gradesLink() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Ссылка на ведомость",
            placeholder: "https://",
            keyboardType: .URL
        )
    }
}
