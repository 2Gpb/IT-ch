//
//  ITCHRecordEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager

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
            static let placeholder: String = "Выберите дату"
            static let alignment: NSTextAlignment = .center
            static let dateFormat: String = "d MMMM yyyy'г.'"
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum DatePicker {
            static let x: CGFloat = 0
            static let y: CGFloat = 0
            static let height: CGFloat = 500
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
    private let datePicker: ITCHDatePicker = ITCHDatePicker(mode: .date)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.isEnabled = false
        IQKeyboardToolbarManager.shared.isEnabled = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardToolbarManager.shared.isEnabled = true
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
            datePicker.configure(with: model.date)
            linkTextField.text = model.link
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpDateTextField()
        setUpDatePicker()
        setUpLinkTextField()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        navigationBar.rightAction = { [weak self] in self?.interactor.loadDismiss() }
        
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
    
    private func setUpDatePicker() {
        datePicker.frame = CGRect(
            x: Constant.DatePicker.x,
            y: Constant.DatePicker.y,
            width: view.frame.width,
            height: Constant.DatePicker.height
        )
        
        datePicker.cancelAction = { [weak self] in
            self?.dateTextField.keyboardState = .close
        }
        
        datePicker.doneAction = { [weak self] in
            self?.dateTextField.text = self?.datePicker.date?.configure(to: Constant.DateTextField.dateFormat)
            self?.dateTextField.keyboardState = .close
        }
        
        dateTextField.setInputView(datePicker)
    }
    
    private func setUpLinkTextField() {
        linkTextField.configure(
            with: ITCHTextFieldViewModel(
                title: Constant.LinkTextField.title,
                placeholder: Constant.LinkTextField.placeholder,
                keyboardType: .URL,
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
