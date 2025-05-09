//
//  ITCHCourseViewController.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCourseBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    
    // MARK: - Lifecycle
    init(interactor: ITCHCourseBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: "Текущий курс",
                leftImage: ITCHImage.chevronLeft24.image,
                rightImage: ITCHImage.options24.image
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.configureRightButtonMenu(items: [changeCourseAction(), changeScheduleAction(), deleteAction()])
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    // MARK: - Actions
    func changeCourseAction() -> UIAction {
        UIAction(title: "Изменить курс", image: ITCHImage.pen20.image) { [weak self] _ in
            self?.interactor.loadChengeCourse()
        }
    }
    
    func changeScheduleAction() -> UIAction {
        UIAction(title: "Изменить расписание", image: ITCHImage.calendar20.image) { [weak self] _ in
            self?.interactor.loadChangeSchedule()
        }
    }
    
    func deleteAction() -> UIAction {
        UIAction(
            title: "Удалить",
            image: ITCHImage.trash20.image,
            attributes: .destructive
        ) { [weak self] _ in
            self?.interactor.loadDismiss()
        }
    }
}
