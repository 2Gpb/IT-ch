//
//  ITCHHomeWorkEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHomeWorkEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum NavigationBar {
            static let createTitle: String = "Добавить задание"
            static let editTitle: String = "Редактирование"
            static let topOffset: CGFloat = 14
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHomeWorkEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHPresentNavigationBar = ITCHPresentNavigationBar()
    
    // MARK: - Lifecycle
    init(interactor: ITCHHomeWorkEditorBusinessLogic) {
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
    func displayStart(for mode: ITCHEditingMode, with model: ITCHHomeWorkModel?) {
        switch mode {
        case .create:
            navigationBar.configure(with: Constant.NavigationBar.createTitle)
        case .edit:
            navigationBar.configure(with: Constant.NavigationBar.editTitle)
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        navigationBar.rightAction = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.NavigationBar.topOffset)
        navigationBar.pinHorizontal(to: view)
    }
}
