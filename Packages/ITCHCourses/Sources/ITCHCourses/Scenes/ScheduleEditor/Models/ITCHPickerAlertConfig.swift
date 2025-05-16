//
//  ITCHPickerAlertConfig.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUIComponents

enum ITCHPickerAlertConfig {
    static func day(
        alert: ITCHPickerAlertView,
        delegate: UIPickerViewDelegate,
        dataSource: UIPickerViewDataSource,
        confirmAction: (() -> Void)?
    ) -> ITCHPickerAlertModel {
        ITCHPickerAlertModel(
            alert: alert,
            items: ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"],
            viewModel: ITCHPickerAlertViewModel(
                title: "День недели",
                delegate: delegate,
                dataSource: dataSource,
                tag: 0,
                onConfirm: confirmAction
            )
        )
    }
    
    static func time(
        alert: ITCHPickerAlertView,
        delegate: UIPickerViewDelegate,
        dataSource: UIPickerViewDataSource,
        confirmAction: (() -> Void)?
    ) -> ITCHPickerAlertModel {
        ITCHPickerAlertModel(
            alert: alert,
            items: ["08:00", "9:30", "11:10", "13:00", "14:40", "16:20", "18:10", "19:40"],
            viewModel: ITCHPickerAlertViewModel(
                title: "Время начала пары",
                delegate: delegate,
                dataSource: dataSource,
                tag: 1,
                onConfirm: confirmAction
            )
        )
    }
    
    static func frequency(
        alert: ITCHPickerAlertView,
        delegate: UIPickerViewDelegate,
        dataSource: UIPickerViewDataSource,
        confirmAction: (() -> Void)?
    ) -> ITCHPickerAlertModel {
        ITCHPickerAlertModel(
            alert: alert,
            items: ["1 раз в неделю", "1 раз в 2 недели"],
            viewModel: ITCHPickerAlertViewModel(
                title: "Частота занятий",
                delegate: delegate,
                dataSource: dataSource,
                tag: 2,
                onConfirm: confirmAction
            )
        )
    }
}
