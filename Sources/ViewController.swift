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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ITCHColor.backgroundDark.color
        cell2.firstAction = {
            print(1)
        }
        
        cell2.secondAction = {
            print(2)
        }
        
        textField.isError = true
        
        view.addSubview(emptyState)
        emptyState.pinCenterY(to: view)
        emptyState.pinHorizontal(to: view, 16)
    }
}
