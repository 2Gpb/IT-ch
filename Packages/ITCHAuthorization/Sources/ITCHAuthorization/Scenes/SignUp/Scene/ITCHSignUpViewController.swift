//
//  ITCHSignUpViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSignUpViewController: UIViewController {
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
        
        enum CreateTitle {
            static let text: String = "Подтвердите почту"
            static let font: UIFont = ITCHFont.header4.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum MailTextField {
            static let title: String = "Email"
            static let placeholder: String = "example@edu.hse.ru"
            static let keyboardType: UIKeyboardType = .emailAddress
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
            static let studentSuffix: String = "@edu.hse.ru"
            static let teacherSuffix: String = "@hse.ru"
        }
        
        enum InfoButton {
            static let title: String = "Кто может войти в приложение?"
            static let font: UIFont = ITCHFont.captionMedium.font
            static let textColor: UIColor = ITCHColor.blue60.color
            static let leadingOffset: CGFloat = 16
            static let height: CGFloat = 32
            static let width: CGFloat = 186
        }
        
        enum ContinueButton {
            static let title: String = "Далее"
            static let topOffset: CGFloat = 32
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSignUpBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let createTitle: UILabel = UILabel()
    private let mailTextField: ITCHTextField = ITCHTextField()
    private let infoButton: UIButton = UIButton(type: .system)
    private let continueButton: ITCHButton = ITCHButton()
    
    // MARK: - Lifecycle
    init(interactor: ITCHSignUpBusinessLogic) {
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
        mailTextField.keyboardState = .open
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpCreateTitle()
        setUpMailTextField()
        setUpInfoButton()
        setUpContinueButton()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
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
    
    private func setUpCreateTitle() {
        createTitle.text = Constant.CreateTitle.text
        createTitle.font = Constant.CreateTitle.font
        createTitle.textColor = Constant.CreateTitle.textColor
        
        view.addSubview(createTitle)
        createTitle.pinTop(to: navigationBar.bottomAnchor, Constant.CreateTitle.topOffset)
        createTitle.pinHorizontal(to: view, Constant.CreateTitle.horizontalOffset)
    }
    
    private func setUpMailTextField() {
        mailTextField.configure(
            with: ITCHTextFieldViewModel(
                title: Constant.MailTextField.title,
                placeholder: Constant.MailTextField.placeholder,
                keyboardType: Constant.MailTextField.keyboardType
            )
        )
        
        mailTextField.editingAction = { [weak self] in
            guard
                let self,
                let text = self.mailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            else {
                self?.continueButton.isEnabled = false
                return
            }
            
            let isValid = text.hasSuffix(Constant.MailTextField.studentSuffix) ||
            text.hasSuffix(Constant.MailTextField.teacherSuffix)
            
            self.continueButton.isEnabled = !text.isEmpty && isValid
        }
        
        view.addSubview(mailTextField)
        mailTextField.pinTop(to: createTitle.bottomAnchor, Constant.MailTextField.topOffset)
        mailTextField.pinHorizontal(to: view, Constant.MailTextField.horizontalOffset)
    }
    
    private func setUpInfoButton() {
        infoButton.setTitle(Constant.InfoButton.title, for: .normal)
        infoButton.titleLabel?.font = Constant.InfoButton.font
        infoButton.tintColor = Constant.InfoButton.textColor
        infoButton.addTarget(self, action: #selector(openInfo), for: .touchUpInside)
        
        view.addSubview(infoButton)
        infoButton.pinTop(to: mailTextField.bottomAnchor)
        infoButton.pinLeft(to: view, Constant.InfoButton.leadingOffset)
        infoButton.setHeight(Constant.InfoButton.height)
        infoButton.setWidth(Constant.InfoButton.width)
    }
    
    private func setUpContinueButton() {
        continueButton.configure(title: Constant.ContinueButton.title)
        continueButton.isEnabled = false
        continueButton.action = { [weak self] in
            self?.mailTextField.keyboardState = .close
            self?.interactor.loadCode(with: self?.mailTextField.text ?? "")
        }
        
        view.addSubview(continueButton)
        continueButton.pinTop(to: infoButton.bottomAnchor, Constant.ContinueButton.topOffset)
        continueButton.pinHorizontal(to: view, Constant.ContinueButton.horizontalOffset)
    }
    
    // MARK: - Actions
    @objc
    private func openInfo() {
        interactor.loadInfo()
    }
}
