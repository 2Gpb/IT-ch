//
//  ITCHRecordEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHRecordEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHRecordEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHPresentNavigationBar = ITCHPresentNavigationBar()
    
    // MARK: - Lifecycle
    init(interactor: ITCHRecordEditorBusinessLogic) {
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
        switch mode {
        case .create:
            navigationBar.configure(with: "Добавить запись")
        case .edit:
            navigationBar.configure(with: "Редактирование")
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.topAnchor, 14)
        navigationBar.pinHorizontal(to: view)
    }
}
