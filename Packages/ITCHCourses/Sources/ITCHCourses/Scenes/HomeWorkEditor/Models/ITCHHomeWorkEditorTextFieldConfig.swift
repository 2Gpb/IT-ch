//
//  ITCHHomeWorkEditorTextFieldConfig.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import ITCHUIComponents

enum ITCHHomeWorkEditorTextFieldConfig {
    static func name() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Название",
            placeholder: "Введите название задания"
        )
    }
    
    static func date() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Дата",
            placeholder: "Выберите дату",
            alignment: .center
        )
    }
    
    static func linkForLoad() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Ссылка для загрузки",
            placeholder: "https://",
            keyboardType: .URL
        )
    }
    
    static func linkForCheck() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Ссылка для проверки",
            placeholder: "https://",
            keyboardType: .URL
        )
    }
    
    static func linkOnTask() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Ссылка на домашнее задание",
            placeholder: "https://",
            keyboardType: .URL
        )
    }
}
