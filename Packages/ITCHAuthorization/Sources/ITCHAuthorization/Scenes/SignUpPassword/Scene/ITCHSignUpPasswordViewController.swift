//
//  ITCHSignUpPasswordViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSignUpPasswordViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum NavigationBar {
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum PasswordTitle {
            static let text: String = "Придумайте пароль"
            static let font: UIFont = ITCHFont.header4.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum PasswordTextField {
            static let title: String = "Пароль"
            static let placeholder: String = "Введите пароль"
            static let keyboardType: UIKeyboardType = .emailAddress
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ContinueButton {
            static let title: String = "Создать аккаунт"
            static let topOffset: CGFloat = 32
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSignUpPasswordBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let passwordTitle: UILabel = UILabel()
    private let passwordTextField: ITCHTextField = ITCHTextField()
    private let continueButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHSignUpPasswordBusinessLogic) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passwordTextField.keyboardState = .open
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpPasswordTitle()
        setUpPasswordTextField()
        setUpContinueButton()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                leftImage: Constant.NavigationBar.leftImage
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.passwordTextField.keyboardState = .close
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpPasswordTitle() {
        passwordTitle.text = Constant.PasswordTitle.text
        passwordTitle.font = Constant.PasswordTitle.font
        passwordTitle.textColor = Constant.PasswordTitle.textColor
        
        view.addSubview(passwordTitle)
        passwordTitle.pinTop(to: navigationBar.bottomAnchor, Constant.PasswordTitle.topOffset)
        passwordTitle.pinHorizontal(to: view, Constant.PasswordTitle.horizontalOffset)
    }
    
    private func setUpPasswordTextField() {
        passwordTextField.configure(
            with: ITCHTextFieldViewModel(
                title: Constant.PasswordTextField.title,
                placeholder: Constant.PasswordTextField.placeholder,
                type: .password,
                keyboardType: Constant.PasswordTextField.keyboardType
            )
        )
        
        view.addSubview(passwordTextField)
        passwordTextField.pinTop(to: passwordTitle.bottomAnchor, Constant.PasswordTextField.topOffset)
        passwordTextField.pinHorizontal(to: view, Constant.PasswordTextField.horizontalOffset)
    }
    
    private func setUpContinueButton() {
        continueButton.configure(title: Constant.ContinueButton.title)
        continueButton.action = { [weak self] in
            self?.interactor.loadCourses(with: self?.passwordTextField.text ?? "")
        }
        
        view.addSubview(continueButton)
        continueButton.pinTop(to: passwordTextField.bottomAnchor, Constant.ContinueButton.topOffset)
        continueButton.pinHorizontal(to: view, Constant.ContinueButton.horizontalOffset)
    }
}
