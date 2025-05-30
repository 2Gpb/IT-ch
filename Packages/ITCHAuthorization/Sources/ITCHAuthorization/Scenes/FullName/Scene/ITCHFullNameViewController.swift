//
//  ITCHFullNameViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHFullNameViewController: UIViewController {
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
        
        enum EnterTitle {
            static let text: String = "Введите полное имя"
            static let font: UIFont = ITCHFont.header4.font
            static let textColor: UIColor = ITCHColor.base0.color
        }
        
        enum Placeholders {
            static let name: String = "Ваше имя"
            static let surname: String = "Ваша фамилия"
            static let patronymic: String = "Ваше отчество*"
        }
        
        enum ContentStack {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 20
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
        }
        
        enum CreateButton {
            static let title: String = "Далее"
            static let topOffset: CGFloat = 32
            static let horizontalOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHFullNameBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let enterTitle: UILabel = UILabel()
    private let nameTextField: ITCHTextField = ITCHTextField(type: .normal)
    private let surnameTextField: ITCHTextField = ITCHTextField(type: .normal)
    private let patronymicTextField: ITCHTextField = ITCHTextField(type: .normal)
    private let createButton: ITCHButton = ITCHButton()
    private let contentStackView: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHFullNameBusinessLogic) {
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
        nameTextField.keyboardState = .open
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpCreateTitle()
        setUpTextFields()
        setUpContentStackView()
        setUpCreateButton()
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
        enterTitle.text = Constant.EnterTitle.text
        enterTitle.font = Constant.EnterTitle.font
        enterTitle.textColor = Constant.EnterTitle.textColor
    }
    
    private func setUpTextFields() {
        nameTextField.configure(with: ITCHTextFieldViewModel(placeholder: Constant.Placeholders.name))
        surnameTextField.configure(with: ITCHTextFieldViewModel(placeholder: Constant.Placeholders.surname))
        patronymicTextField.configure(with: ITCHTextFieldViewModel(placeholder: Constant.Placeholders.patronymic))
        
        [nameTextField, surnameTextField].forEach { textField in
            textField.editingAction = { [weak self] in
                if self?.nameTextField.text != "" && self?.surnameTextField.text != "" {
                    self?.createButton.isEnabled = true
                } else {
                    self?.createButton.isEnabled = false
                }
            }
        }
    }
    
    private func setUpContentStackView() {
        contentStackView.axis = Constant.ContentStack.axis
        contentStackView.spacing = Constant.ContentStack.spacing
        
        [enterTitle, nameTextField, surnameTextField, patronymicTextField].forEach { element in
            contentStackView.addArrangedSubview(element)
        }
        
        view.addSubview(contentStackView)
        contentStackView.pinTop(to: navigationBar.bottomAnchor, Constant.ContentStack.topOffset)
        contentStackView.pinHorizontal(to: view, Constant.ContentStack.horizontalOffset)
    }
    
    private func setUpCreateButton() {
        createButton.configure(title: Constant.CreateButton.title)
        createButton.action = createButtonAction
        createButton.isEnabled = false
        
        view.addSubview(createButton)
        createButton.pinTop(to: contentStackView.bottomAnchor, Constant.CreateButton.topOffset)
        createButton.pinHorizontal(to: view, Constant.CreateButton.horizontalOffset)
    }
    
    // MARK: - Actions
    private func createButtonAction() {
        nameTextField.keyboardState = .close
        surnameTextField.keyboardState = .close
        patronymicTextField.keyboardState = .close
        
        interactor.loadSignUp(
            with:
                "\(surnameTextField.text ?? "") \(nameTextField.text ?? "") \(patronymicTextField.text ?? "")"
        )
    }
}
