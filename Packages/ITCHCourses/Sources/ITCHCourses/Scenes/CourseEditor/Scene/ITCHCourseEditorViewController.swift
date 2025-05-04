//
//  ITCHCourseEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCourseEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    
    // MARK: - Lifecycle
    init(
        interactor: ITCHCourseEditorBusinessLogic
    ) {
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
        interactor.loadStart()
    }
    
    // MARK: - Methods
    func displayStart(with mode: ITCHEditingMode) {
        let title: String
        switch mode {
        case .create:
            title = "Создать курс"
        case .edit:
            title = "Изменить курс"
        }
        
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: title,
                leftImage: ITCHImage.chevronLeft24.image
            )
        )
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
}
