//
//  ITCHHomeWorkEditorViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import IQKeyboardManagerSwift
import IQKeyboardToolbarManager

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
        
        enum DeleteButton {
            static let title: String = "Удалить задание"
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ContentScroll {
            static let bottomOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum DatePicker {
            static let x: CGFloat = 0
            static let y: CGFloat = 0
            static let height: CGFloat = 520
            static let dateFormat: String = "d MMMM yyyy'г.,' H:mm"
        }
        
        enum LinksStack {
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let spacing: CGFloat = 20
            static let distribution: UIStackView.Distribution = .fillEqually
            static let horizontalOffsets: CGFloat = 32
        }
        
        enum ContentStack {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 12
            static let topOffset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHomeWorkEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHPresentNavigationBar = ITCHPresentNavigationBar()
    private let nameTextField: ITCHTextField = ITCHTextField()
    private let dateTextField: ITCHTextField = ITCHTextField()
    private let datePicker: ITCHDatePicker = ITCHDatePicker(mode: .dateAndTime)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.keyboardState = .open
    }
    
    // MARK: - Methods
    func displayStart(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork?) {
        if let model {
            navigationBar.configure(with: Constant.NavigationBar.editTitle)
            setUpDeleteButton()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "ru_RU")

            let date = formatter.date(from: model.date)
            
            nameTextField.text = model.title
            dateTextField.text = date?.configure(to: Constant.DatePicker.dateFormat)
            linkForLoadTextField.text = model.linkForLoad
            linkForCheckTextField.text = model.linkForCheck
            linkOnTaskTextField.text = model.linkOnTask
        } else {
            navigationBar.configure(with: Constant.NavigationBar.createTitle)
            navigationBar.rightAction = { [weak self] in
                let inputFormatter = DateFormatter()
                inputFormatter.locale = Locale(identifier: "ru_RU")
                inputFormatter.dateFormat = "d MMMM yyyyг., H:mm"
                let date = inputFormatter.date(from: self?.dateTextField.text ?? "")
                
                self?.interactor.loadAddHomeWork(
                    with: ITCHHomeWorkEditorModel.Local.ITCHHomeWork(
                        id: 0,
                        title: self?.nameTextField.text ?? "",
                        date: date?.configure(to: "yyyy-MM-dd") ?? "",
                        linkOnTask: self?.linkOnTaskTextField.text ?? "",
                        linkForCheck: self?.linkForCheckTextField.text ?? "",
                        linkForLoad: self?.linkForLoadTextField.text ?? ""
                    )
                )
            }
        }
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpContentScrollView()
        setUpTextFields()
        setUpDatePicker()
        setUpLinksStackView()
        setUpContentStackView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in self?.interactor.loadDismiss() }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.NavigationBar.topOffset)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpDeleteButton() {
        deleteButton.configure(title: Constant.DeleteButton.title)
        deleteButton.action = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(deleteButton)
        deleteButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.DeleteButton.bottomOffset)
        deleteButton.pinHorizontal(to: view, Constant.DeleteButton.horizontalOffset)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, Constant.ContentScroll.horizontalOffset)
        contentScrollView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.ContentScroll.bottomOffset)
    }
    
    private func setUpTextFields() {
        nameTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.name())
        dateTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.date())
        linkForLoadTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkForLoad())
        linkForCheckTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkForCheck())
        linkOnTaskTextField.configure(with: ITCHHomeWorkEditorTextFieldConfig.linkOnTask())
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
            self?.dateTextField.text = self?.datePicker.date?.configure(to: Constant.DatePicker.dateFormat)
            self?.dateTextField.keyboardState = .close
        }
        
        dateTextField.setInputView(datePicker)
        dateTextField.beforeOpenKeyboardAction = { 
            IQKeyboardManager.shared.isEnabled = false
            IQKeyboardToolbarManager.shared.isEnabled = false
        }
        
        dateTextField.afterCloseKeyboardAction = {
            IQKeyboardManager.shared.isEnabled = true
            IQKeyboardToolbarManager.shared.isEnabled = true
        }
    }
    
    private func setUpLinksStackView() {
        linksStackView.axis = Constant.LinksStack.axis
        linksStackView.spacing = Constant.LinksStack.spacing
        linksStackView.distribution = Constant.LinksStack.distribution
        linksStackView.setWidth(view.frame.width - Constant.LinksStack.horizontalOffsets)
        [linkForLoadTextField, linkForCheckTextField].forEach { element in
            linksStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = Constant.ContentStack.axis
        contentStackView.spacing = Constant.ContentStack.spacing
        [nameTextField, dateTextField, linksStackView, linkOnTaskTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, Constant.ContentStack.topOffset)
        contentStackView.pinHorizontal(to: contentScrollView)
    }
}
