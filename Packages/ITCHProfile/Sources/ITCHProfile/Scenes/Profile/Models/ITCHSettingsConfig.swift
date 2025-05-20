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
            accountModel: ITCHAccountModel(
                image: nil,
                name: "",
                info: ""
            )
        ),
        ITCHSettingsSection(
            rows: [
                .header("Настройки"),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.appearance32.image,
                        title: "Внешний вид",
                        subtitle: "Изменить",
                        type: .standard,
                        action: .appearance
                    )
                ),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.language32.image,
                        title: "Сменить язык",
                        subtitle: "Выбрать язык интерфейса",
                        type: .standard,
                        action: .language
                    )
                ),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.notifications32.image,
                        title: "Уведомления",
                        subtitle: "Допуск уведомлений",
                        type: .toggle(
                            isOn: true
                        ),
                        action: nil
                    )
                ),
                .footer
            ]
        ),
        ITCHSettingsSection(
            rows: [
                .header("Другое"),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.info32.image,
                        title: "О приложении",
                        subtitle: "Самое важное",
                        type: .standard,
                        action: .about
                    )
                ),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.help32.image,
                        title: "Сообщить о проблеме",
                        subtitle: "Наши контакты",
                        type: .standard,
                        action: .contacts
                    )
                ),
                .setting(
                    ITCHSettingsModel(
                        image: ITCHImage.exit32.image,
                        title: "Выйти",
                        subtitle: "Безопасный выход из аккаунта",
                        type: .destructive,
                        action: .exit
                    )
                ),
                .footer
            ]
        )
    ]
}
