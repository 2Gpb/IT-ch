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
    private let nameTextField: ITCHTextField = ITCHTextField()
    private let dateTextField: ITCHTextField = ITCHTextField()
    private let linkForLoadTextField: ITCHTextField = ITCHTextField()
    private let linkForCheckTextField: ITCHTextField = ITCHTextField()
    private let linksStackView: UIStackView = UIStackView()
    private let linkOnTaskTextField: ITCHTextField = ITCHTextField()
    private let deleteButton: ITCHButton = ITCHButton(type: .delete)
    private let contentStackView: UIStackView = UIStackView()
    private let contentScrollView: UIScrollView = UIScrollView()
    
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
            setUpDeleteButton()
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpContentScrollView()
        setUpTextFields()
        setUplinksStackView()
        setUpContentStackView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        navigationBar.rightAction = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.NavigationBar.topOffset)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpDeleteButton() {
        deleteButton.configure(title: "Удалить задание")
        deleteButton.action = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(deleteButton)
        deleteButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 20)
        deleteButton.pinHorizontal(to: view, 16)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, 16)
        contentScrollView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 20)
    }
    
    private func setUpTextFields() {
        nameTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.name())
        dateTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.date())
        linkForLoadTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkForLoad())
        linkForCheckTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkForCheck())
        linkOnTaskTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkOnTask())
    }
    
    private func setUplinksStackView() {
        linksStackView.axis = .horizontal
        linksStackView.spacing = 20
        linksStackView.distribution = .fillEqually
        linksStackView.setWidth(view.frame.width - 32.0)
        [linkForLoadTextField, linkForCheckTextField].forEach { element in
            linksStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = .vertical
        contentStackView.spacing = 12
        [nameTextField, dateTextField, linksStackView, linkOnTaskTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, 20)
        contentStackView.pinHorizontal(to: contentScrollView)
    }
}
