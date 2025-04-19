//
//  ITCHLoginViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHLoginViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title = "Вход в аккаунт"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum Email {
            static let title: String = "Email"
            static let placeholder: String = "example@edu.hse.ru"
            static let topOffset: CGFloat = 24
            static let horizontalOffset: CGFloat = 16
        }
        
        enum Password {
            static let title: String = "Пароль"
            static let placeholder: String = "Введите пароль"
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ForgotPassword {
            static let title: String = "Забыли пароль?"
            static let font: UIFont = ITCHFont.captionMedium.font
            static let textColor: UIColor = ITCHColor.blue60.color
            static let state: UIControl.State = .normal
            static let trailingOffset: CGFloat = 16
            static let height: CGFloat = 32
            static let width: CGFloat = 105
        }
        
        enum Enter {
            static let title: String = "Войти"
            static let topOffset: CGFloat = 32
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHLoginBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emailTextField: ITCHTextField = ITCHTextField()
    private let passwordTextField: ITCHTextField = ITCHTextField()
    private let forgotPasswordButton: UIButton = UIButton(type: .system)
    private let enterButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHLoginBusinessLogic) {
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
        emailTextField.keyboardState = .open
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpNavigationBar()
        setUpEmailTextField()
        setUpPasswordTextField()
        setUpForgotPasswordButton()
        setUpEnterButton()
    }
    
    private func setUpView() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpEmailTextField() {
        emailTextField.configure(
            with: ITCHTextFieldModel(
                title: Constant.Email.title,
                placeholder: Constant.Email.placeholder
            )
        )
        
        view.addSubview(emailTextField)
        emailTextField.pinTop(to: navigationBar.bottomAnchor, Constant.Email.topOffset)
        emailTextField.pinHorizontal(to: view, Constant.Email.horizontalOffset)
    }
    
    private func setUpPasswordTextField() {
        passwordTextField.configure(
            with: ITCHTextFieldModel(
                title: Constant.Password.title,
                placeholder: Constant.Password.placeholder,
                type: .password
            )
        )
        
        view.addSubview(passwordTextField)
        passwordTextField.pinTop(to: emailTextField.bottomAnchor, Constant.Password.topOffset)
        passwordTextField.pinHorizontal(to: view, Constant.Password.horizontalOffset)
    }
    
    private func setUpForgotPasswordButton() {
        forgotPasswordButton.setTitle(Constant.ForgotPassword.title, for: Constant.ForgotPassword.state)
        forgotPasswordButton.titleLabel?.font = Constant.ForgotPassword.font
        forgotPasswordButton.tintColor = Constant.ForgotPassword.textColor
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.pinTop(to: passwordTextField.bottomAnchor)
        forgotPasswordButton.pinRight(to: view, Constant.ForgotPassword.trailingOffset)
        forgotPasswordButton.setHeight(Constant.ForgotPassword.height)
        forgotPasswordButton.setWidth(Constant.ForgotPassword.width)
    }
    
    private func setUpEnterButton() {
        enterButton.configure(title: Constant.Enter.title)
        
        view.addSubview(enterButton)
        enterButton.pinTop(to: forgotPasswordButton.bottomAnchor, Constant.Enter.topOffset)
        enterButton.pinHorizontal(to: view, Constant.Enter.horizontalOffset)
    }
    
    // MARK: - Actions
    @objc
    private func dismissKeyboard() {
        emailTextField.keyboardState = .close
        passwordTextField.keyboardState = .close
    }
}
