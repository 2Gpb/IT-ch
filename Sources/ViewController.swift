//
//  ViewController.swift
//  IT-ch
//
//  Created by Peter on 06.02.2025.
//

import UIKit
import ITCHUIComponents

final class ViewController: UIViewController {
    // MARK: - Private fields
//    private let button: ITCHButton = ITCHButton(title: "Далее")
//    
//    private let cell2: ITCHClassRecordCell = ITCHClassRecordCell(type: .teacher)
//    
//    private let cell3: ITCHCourseCell = ITCHCourseCell()
    
//    private let deadline: ITCHDeadlineView = ITCHDeadlineView()
    
//    private let emptyState: ITCHEmptyStateView = ITCHEmptyStateView()
    
//    private let row: ITCHNavigationRow = ITCHNavigationRow()
    
//    private let cell: ITCHHomeWorkCell = ITCHHomeWorkCell(type: .teacher)
    
//    private let navBar: ITCHNavigationBar = ITCHNavigationBar()
    
//    private let notification: ITCHNotificationCell = ITCHNotificationCell()
    
//    private let schedule: ITCHScheduleCell = ITCHScheduleCell()
    
//    private let settingRow: ITCHSettingsRow = ITCHSettingsRow()
    
    private let textField: ITCHTextField = ITCHTextField()
    
    private let user: ITCHUserRow = ITCHUserRow(
        name: "Тюхменев Петр Вячеславович",
        info: "Бакалавриат 21 ПИ-3"
    )
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ITCHColor.backgroundDark.color
        
        textField.configure(
            with: ITCHTextFieldModel(
                title: "Номер телефона",
                placeholder: "Введите ваш номер",
                type: .password
            )
        )
        
        view.addSubview(textField)
        textField.pinCenterY(to: view)
        textField.pinHorizontal(to: view, 16)
    }
}
