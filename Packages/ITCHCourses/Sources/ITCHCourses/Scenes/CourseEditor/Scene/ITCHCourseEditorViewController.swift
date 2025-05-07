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
    private let nameTextField: ITCHTextField = ITCHTextField()
    private let locationTextField: ITCHTextField = ITCHTextField()
    private let durationTextField: ITCHTextField = ITCHTextField()
    private let locationDurationStackView: UIStackView = UIStackView()
    private let chatLinkTextField: ITCHTextField = ITCHTextField()
    private let gradesLinkTextField: ITCHTextField = ITCHTextField()
    private let contentStackView: UIStackView = UIStackView()
    private let contentScrollView: UIScrollView = UIScrollView()
    private let continueButton: ITCHButton = ITCHButton()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.keyboardState = .open
    }
    
    // MARK: - Methods
    func displayStart(with mode: ITCHEditingMode) {
        let title: String
        switch mode {
        case .create:
            title = "Создать курс"
            continueButton.configure(title: "Далее")
        case .edit:
            title = "Изменить курс"
            continueButton.configure(title: "Сохранить")
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
        setUpContinueButton()
        setUpContentScrollView()
        setUpNameTextField()
        setUpLocationTextField()
        setUpDurationTextField()
        setUpLocationDurationStackView()
        setUpChatLinkTextField()
        setUpGradesLinkTextField()
        setUpContentStackView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.backgroundColor = ITCHColor.backgroundGray.color
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpContinueButton() {
        view.addSubview(continueButton)
        continueButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 20)
        continueButton.pinHorizontal(to: view, 16)
    }
    
    private func setUpContentScrollView() {
        view.addSubview(contentScrollView)
        contentScrollView.pinTop(to: navigationBar.bottomAnchor)
        contentScrollView.pinHorizontal(to: view, 16)
        contentScrollView.pinBottom(to: continueButton.topAnchor, 20)
    }
    
    private func setUpNameTextField() {
        nameTextField.configure(
            with: ITCHTextFieldModel(
                title: "Название",
                placeholder: "Введите название курса",
                type: .normal
            )
        )
    }
    
    private func setUpLocationTextField() {
        locationTextField.configure(
            with: ITCHTextFieldModel(
                title: "Место проведения",
                placeholder: "Введите место",
                type: .normal
            )
        )
    }
    
    private func setUpDurationTextField() {
        durationTextField.configure(
            with: ITCHTextFieldModel(
                title: "Время курса в модулях",
                placeholder: "Выберете модули",
                type: .normal
            )
        )
    }
    
    private func setUpLocationDurationStackView() {
        locationDurationStackView.axis = .horizontal
        locationDurationStackView.spacing = 20
        locationDurationStackView.distribution = .fillEqually
        locationDurationStackView.setWidth(view.frame.width - 32.0)
        [locationTextField, durationTextField].forEach { element in
            locationDurationStackView.addArrangedSubview(element)
        }
    }
    
    private func setUpChatLinkTextField() {
        chatLinkTextField.configure(
            with: ITCHTextFieldModel(
                title: "Ссылка на чат",
                placeholder: "https://",
                type: .normal
            )
        )
    }
    
    private func setUpGradesLinkTextField() {
        gradesLinkTextField.configure(
            with: ITCHTextFieldModel(
                title: "Ссылка на ведомость",
                placeholder: "https://",
                type: .normal
            )
        )
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        [nameTextField, locationDurationStackView, chatLinkTextField, gradesLinkTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        contentScrollView.addSubview(contentStackView)
        contentStackView.pinTop(to: contentScrollView, 20)
        contentStackView.pinLeft(to: contentScrollView)
        contentStackView.pinRight(to: contentScrollView)
    }
}
