//
//  ITCHScheduleEditor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHScheduleEditorViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHScheduleEditorBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let dayTextField: ITCHTextField = ITCHTextField()
    private let numberOfHoursTextField: ITCHTextField = ITCHTextField()
    private let startTimeTextField: ITCHTextField = ITCHTextField()
    private let timeStackView: UIStackView = UIStackView()
    private let frequencyTextField: ITCHTextField = ITCHTextField()
    private let contentStackView: UIStackView = UIStackView()
    private let contentScrollView: UIScrollView = UIScrollView()
    private let saveButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHScheduleEditorBusinessLogic) {
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
            title = "Добавить расписание"
            saveButton.configure(title: "Создать курс")
            saveButton.action = { [weak self] in
                self?.interactor.loadCourses()
            }
        case .edit:
            title = "Изменить расписание"
            saveButton.configure(title: "Сохранить")
            saveButton.action = { [weak self] in
                self?.interactor.loadDismiss()
            }
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
        setUpSaveButton()
        setUpContentScrollView()
        setUpTextFields()
        setUpTimeStackView()
        setUpContentStackView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpSaveButton() {
        view.addSubview(saveButton)
        saveButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 20)
        saveButton.pinHorizontal(to: view, 16)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, 16)
        contentScrollView.pinBottom(to: saveButton.topAnchor, 20)
    }
    
    private func setUpTextFields() {
        dayTextField.configure(with: ITCHScheduleEditorTextFieldConfig.day())
        numberOfHoursTextField.configure(with: ITCHScheduleEditorTextFieldConfig.numberOfHours())
        startTimeTextField.configure(with: ITCHScheduleEditorTextFieldConfig.startTime())
        frequencyTextField.configure(with: ITCHScheduleEditorTextFieldConfig.frequency())
    }
    
    private func setUpTimeStackView() {
        timeStackView.axis = .horizontal
        timeStackView.spacing = 20
        timeStackView.distribution = .fillEqually
        timeStackView.setWidth(view.frame.width - 32.0)
        [numberOfHoursTextField, startTimeTextField].forEach { element in
            timeStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        [dayTextField, timeStackView, frequencyTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, 20)
        contentStackView.pinHorizontal(to: contentScrollView)
    }
}
