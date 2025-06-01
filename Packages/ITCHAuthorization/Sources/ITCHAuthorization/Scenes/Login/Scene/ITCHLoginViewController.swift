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
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
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
        
        enum ErrorView {
            static let animationDuration: TimeInterval = 0.4
            static let animationDelay: TimeInterval = 0
            static let damping: CGFloat = 0.8
            static let velocity: CGFloat = 0.4
            static let initialAlpha: CGFloat = 1
            static let finalAlpha: CGFloat = 0
            static let initialYOffset: CGFloat = 0
            static let visibleDuration: TimeInterval = 1.5
            static let horizontalOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHLoginBusinessLogic
    private var errorViewBottomConstraint: NSLayoutConstraint?
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emailTextField: ITCHTextField = ITCHTextField()
    private let passwordTextField: ITCHTextField = ITCHTextField()
    private let forgotPasswordButton: UIButton = UIButton(type: .system)
    private let enterButton: ITCHButton = ITCHButton()
    private let errorView: ITCHErrorLoginView = ITCHErrorLoginView()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.keyboardState = .open
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Methods
    func showErrorAnimated() {
        prepareErrorState()
        animateErrorEntry()
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpNavigationBar()
        setUpEmailTextField()
        setUpPasswordTextField()
        setUpForgotPasswordButton()
        setUpEnterButton()
        setUpErrorView()
    }
    
    private func setUpView() {
        view.backgroundColor = Constant.View.backgroundColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
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
            with: ITCHTextFieldViewModel(
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
            with: ITCHTextFieldViewModel(
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
        forgotPasswordButton.addTarget(self, action: #selector(openLinkPasswordRecovery), for: .touchUpInside)
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.pinTop(to: passwordTextField.bottomAnchor)
        forgotPasswordButton.pinRight(to: view, Constant.ForgotPassword.trailingOffset)
        forgotPasswordButton.setHeight(Constant.ForgotPassword.height)
        forgotPasswordButton.setWidth(Constant.ForgotPassword.width)
    }
    
    private func setUpEnterButton() {
        enterButton.configure(title: Constant.Enter.title)
        enterButton.action = { [weak self] in
            self?.interactor.loadCourses(
                email: self?.emailTextField.text?.lowercased() ?? "",
                password: self?.passwordTextField.text ?? ""
            )
        }
        
        view.addSubview(enterButton)
        enterButton.pinTop(to: forgotPasswordButton.bottomAnchor, Constant.Enter.topOffset)
        enterButton.pinHorizontal(to: view, Constant.Enter.horizontalOffset)
    }
    
    private func setUpErrorView() {
        self.errorView.isHidden = true
        
        view.addSubview(errorView)
        errorView.pinHorizontal(to: view, Constant.ErrorView.horizontalOffset)
        
        errorViewBottomConstraint = errorView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -Constant.ErrorView.bottomOffset
        )
        
        errorViewBottomConstraint?.isActive = true
    }
    
    // MARK: - Animations
    private func prepareErrorState() {
        errorView.transform = CGAffineTransform(
            translationX: -view.bounds.width,
            y: Constant.ErrorView.initialYOffset
        )
        
        errorView.isHidden = false
        errorView.alpha = Constant.ErrorView.initialAlpha
        emailTextField.isError = true
        passwordTextField.isError = true
    }

    private func animateErrorEntry() {
        UIView.animate(
            withDuration: Constant.ErrorView.animationDuration,
            delay: Constant.ErrorView.animationDelay,
            usingSpringWithDamping: Constant.ErrorView.damping,
            initialSpringVelocity: Constant.ErrorView.velocity,
            options: [.curveEaseOut],
            animations: {
                self.errorView.transform = .identity
            },
            completion: { _ in
                self.animateErrorExit()
            }
        )
    }

    private func animateErrorExit() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constant.ErrorView.visibleDuration) {
            UIView.animate(
                withDuration: Constant.ErrorView.animationDuration,
                animations: {
                    self.errorView.transform = CGAffineTransform(
                        translationX: self.view.bounds.width,
                        y: Constant.ErrorView.initialYOffset
                    )
                    
                    self.errorView.alpha = Constant.ErrorView.finalAlpha
                },
                completion: { _ in
                    self.resetErrorState()
                }
            )
        }
    }

    private func resetErrorState() {
        errorView.isHidden = true
        emailTextField.isError = false
        passwordTextField.isError = false
    }
}

// MARK: - Actions
extension ITCHLoginViewController {
    @objc
    private func dismissKeyboard() {
        emailTextField.keyboardState = .close
        passwordTextField.keyboardState = .close
    }
    
    @objc
    private func openLinkPasswordRecovery() {
        interactor.loadPasswordRecovery()
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        let shift = keyboardFrame.height - view.safeAreaInsets.bottom + Constant.ErrorView.bottomOffset

        errorViewBottomConstraint?.constant = -shift

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }

    @objc
    private func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        errorViewBottomConstraint?.constant = -Constant.ErrorView.bottomOffset

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}
