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
    private let button: ITCHButton = ITCHButton(title: "Далее")
    private let row: ITCHNavigationRow = ITCHNavigationRow(title: "Чат курса", leftImage: ITCHImage.vk28.image)
    private let cell: ITCHHomeWorkCell = ITCHHomeWorkCell(title: "Домашнее задание 5", date: Date(), type: .teacher)
    private let textField: ITCHTextField = ITCHTextField(
        title: "Номер телефона",
        placeholder: "Введите ваш номер",
        type: .password
    )
    private let navBar: ITCHNavigationBar = ITCHNavigationBar(
        title: "Текущий курс",
        leftImage: ITCHImage.chevronLeft24.image,
        rightImage: ITCHImage.plus24.image
    )
    
    private let cell2: ITCHClassRecordCell = ITCHClassRecordCell(
        type: .teacher,
        date: Date()
    )
    
    private let cell3: ITCHCourseCell = ITCHCourseCell(
        duration: "1 - 3 модуль",
        role: "Преподаватель",
        courseName: "НИС “Основы iOS разработки на UIKit”",
        teacherName: "Сосновский Григорий Михайлович",
        image: UIImage()
    )
    
    private let emptyState: ITCHEmptyStateView = ITCHEmptyStateView(
        title: "У вас пока нет курсов",
        description: "Вы сможете присоединиться,\nкак только вас пригласят."
    )
    
    private let deadline: ITCHDeadlineView = ITCHDeadlineView(
        course: "НИС “Основы iOS разработки на UIKit”",
        title: "Домашняя работа 5",
        deadline: Date()
    )
    
    private let settingRow: ITCHSettingsRow = ITCHSettingsRow(
        image: ITCHImage.info32.image,
        title: "О приложении",
        subtitle: "Самое важное"
    )
    
    private let user: ITCHUserRow = ITCHUserRow(name: "Тюхменев Петр Вячеславович", info: "Бакалавриат 21 ПИ-3")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ITCHColor.backgroundDark.color
        
        view.addSubview(user)
        user.pinCenterY(to: view)
        user.pinHorizontal(to: view, 16)
    }
}
