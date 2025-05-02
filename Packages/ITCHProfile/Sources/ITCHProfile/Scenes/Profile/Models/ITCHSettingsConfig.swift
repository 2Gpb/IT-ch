//
//  ITCHSettingsConfig.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import ITCHUIComponents

enum ITCHSettingsConfig {
    static let sections: [ITCHSettingsSection] = [
        ITCHSettingsSection(
            title: "Настройки",
            settings: [
                ITCHSettingsModel(
                    image: ITCHImage.appearance32.image,
                    title: "Внешний вид",
                    subtitle: "Изменить",
                    type: .standard
                ),
                ITCHSettingsModel(
                    image: ITCHImage.language32.image,
                    title: "Сменить язык",
                    subtitle: "Выбрать язык интерфейса",
                    type: .standard
                ),
                ITCHSettingsModel(
                    image: ITCHImage.notifications32.image,
                    title: "Уведомления",
                    subtitle: "Допуск уведомлений",
                    type: .toggle(isOn: true)
                )
            ]
        ),
        ITCHSettingsSection(
            title: "Другое",
            settings: [
                ITCHSettingsModel(
                    image: ITCHImage.info32.image,
                    title: "О приложении",
                    subtitle: "Самое важное",
                    type: .standard
                ),
                ITCHSettingsModel(
                    image: ITCHImage.help32.image,
                    title: "Помощь",
                    subtitle: "Наши контакты",
                    type: .standard
                ),
                ITCHSettingsModel(
                    image: ITCHImage.exit32.image,
                    title: "Выйти",
                    subtitle: "Безопасный выход из аккаунта",
                    type: .destructive
                )
            ]
        )
    ]
}
