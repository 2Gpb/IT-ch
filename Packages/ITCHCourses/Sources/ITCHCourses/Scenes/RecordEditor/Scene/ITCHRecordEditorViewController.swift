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
        
        enum NavigationBar {
            static let createTitle = "Добавить запись"
            static let editTitle = "Редактирование"
            static let topOffset: CGFloat = 14
        }
        
        enum DateTextField {
            static let title: String = "Дата"
            static let placeholder: String = "Дата"
            static let alignment: NSTextAlignment = .center
            static let dateFormat: String = "d MMMM yyyy'г.'"
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum LinkTextField {
            static let title: String = "Ссылка на занятие"
            static let placeholder: String = "Вставьте ссылку на занятия"
            static let alignment: NSTextAlignment = .center
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
        }
        
        enum DeleteButton {
            static let title: String = "Удалить запись"
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHRecordEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHPresentNavigationBar = ITCHPresentNavigationBar()
    private let dateTextField: ITCHTextField = ITCHTextField()
    private let linkTextField: ITCHTextField = ITCHTextField()
    private let deleteButton: ITCHButton = ITCHButton(type: .delete)
    
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
    func displayStart(for mode: ITCHEditingMode, with model: ITCHRecordModel?) {
        switch mode {
        case .create:
            navigationBar.configure(with: Constant.NavigationBar.createTitle)
        case .edit:
            navigationBar.configure(with: Constant.NavigationBar.editTitle)
            setUpDeleteButton()
        }
        
        if let model {
            dateTextField.text = model.date.configure(to: Constant.DateTextField.dateFormat)
            linkTextField.text = model.link
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpDateTextField()
        setUpLinkTextField()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.topAnchor, Constant.NavigationBar.topOffset)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpDateTextField() {
        dateTextField.configure(
            with: ITCHTextFieldViewModel(
                title: Constant.DateTextField.title,
                placeholder: Constant.DateTextField.placeholder,
                alignment: Constant.DateTextField.alignment
            )
        )
        
        view.addSubview(dateTextField)
        dateTextField.pinTop(to: navigationBar.bottomAnchor, Constant.DateTextField.topOffset)
        dateTextField.pinHorizontal(to: view, Constant.DateTextField.horizontalOffset)
    }
    
    private func setUpLinkTextField() {
        linkTextField.configure(
            with: ITCHTextFieldViewModel(
                title: Constant.LinkTextField.title,
                placeholder: Constant.LinkTextField.placeholder,
                alignment: Constant.LinkTextField.alignment
            )
        )
        
        view.addSubview(linkTextField)
        linkTextField.pinTop(to: dateTextField.bottomAnchor, Constant.LinkTextField.topOffset)
        linkTextField.pinHorizontal(to: view, Constant.LinkTextField.horizontalOffset)
    }
    
    private func setUpDeleteButton() {
        deleteButton.configure(title: Constant.DeleteButton.title)
        deleteButton.action = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(deleteButton)
        deleteButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.DeleteButton.bottomOffset)
        deleteButton.pinHorizontal(to: view, Constant.DeleteButton.horizontalOffset)
    }
}
