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
    private let navBar: ITCHNavigationBar = ITCHNavigationBar(
        title: "Текущий курс",
        leftImage: ITCHImage.chevronLeft24.image,
        rightImage: ITCHImage.plus24.image
    )
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ITCHColor.backgroundDark.color
        cell.firstAction = {
            print(1)
        }
        
        cell.secondAction = {
            print(2)
        }
        
        view.addSubview(cell)
        cell.pinCenterY(to: view)
        cell.pinHorizontal(to: view, 16)
    }
}
