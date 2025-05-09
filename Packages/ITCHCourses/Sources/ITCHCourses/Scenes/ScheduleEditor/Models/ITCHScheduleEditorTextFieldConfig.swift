//
//  ITCHScheduleEditorTextFieldConfig.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import ITCHUIComponents

enum ITCHScheduleEditorTextFieldConfig {
    static func day() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "День недели",
            placeholder: "Выберите день",
            alignment: .center
        )
    }
    
    static func numberOfHours() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Академические часы",
            placeholder: "Введите цифру",
            keyboardType: .numberPad,
            alignment: .center
        )
    }
    
    static func startTime() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Время начала первой пары",
            placeholder: "Выберите время",
            alignment: .center
        )
    }
    
    static func frequency() -> ITCHTextFieldViewModel {
        ITCHTextFieldViewModel(
            title: "Частота",
            placeholder: "Выберите частоту",
            alignment: .center
        )
    }
}
