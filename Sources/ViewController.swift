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
    private let textField: ITCHTextField = ITCHTextField(title: "Номер телефона", placeholder: "Введите ваш номер")
    private let navBar: ITCHNavigationBar = ITCHNavigationBar(
        title: "Текущий курс",
        leftImage: ITCHImage.chevronLeft24.image,
        rightImage: ITCHImage.plus24.image
    )
    
    private let cell2: ITCHClassRecordCell = ITCHClassRecordCell(
        type: .teacher,
        date: Date()
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
        
        view.addSubview(cell2)
        cell2.pinCenterY(to: view)
        cell2.pinHorizontal(to: view, 16)
    }
}
