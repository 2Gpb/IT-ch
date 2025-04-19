//
//  ITCHWelcomViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHWelcomeViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Title {
            static let text: String = "Welcome\nto IT-ch"
            static let font: UIFont = ITCHFont.header3.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let numberOfLines: Int = 2
        }
        
        enum Enter {
            static let title: String = "Войти через ЕЛК"
        }
        
        enum WelcomeStack {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 40
            static let distribution: UIStackView.Distribution = .fill
            static let horizontalOffset: CGFloat = 16
        }
        
        enum ReadMore {
            static let title: String = "Не слышли о нас?"
            static let titleFont: UIFont = ITCHFont.captionMedium.font
            static let titleTextColor: UIColor = ITCHColor.base0.color
            static let buttonTitle: String = "Узнать больше"
            static let buttonFont: UIFont = ITCHFont.captionMedium.font
            static let buttonTextColor: UIColor = ITCHColor.blue60.color
            static let buttonHeight: CGFloat = 32
            static let buttonWidth: CGFloat = 98
            static let axis: NSLayoutConstraint.Axis = .horizontal
            static let bottomOffset: CGFloat = 8
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHWelcomeBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .image)
    private let titleLabel: UILabel = UILabel()
    private let enterButton: ITCHButton = ITCHButton(title: Constant.Enter.title)
    private let welcomeStack: UIStackView = UIStackView()
    private let readMoreLabel: UILabel = UILabel()
    private let readMoreButton: UIButton = UIButton(type: .system)
    private let readMoreStack: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHWelcomeBusinessLogic) {
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
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpNavigationBar()
        setUpTitleLabel()
        setUpWelcomeStack()
        setUpReadMoreStackContent()
        setUpReadMoreStack()
    }
    
    private func setUpView() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = ITCHColor.backgroundGray.color
    }
    
    private func setUpNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpTitleLabel() {
        titleLabel.text = Constant.Title.text
        titleLabel.font = Constant.Title.font
        titleLabel.textColor = Constant.Title.textColor
        titleLabel.numberOfLines = Constant.Title.numberOfLines
    }
    
    private func setUpWelcomeStack() {
        enterButton.action = { [weak self] in
            self?.interactor.loadSelectAccount()
        }
        
        welcomeStack.axis = Constant.WelcomeStack.axis
        welcomeStack.spacing = Constant.WelcomeStack.spacing
        welcomeStack.distribution = Constant.WelcomeStack.distribution
        
        [titleLabel, enterButton].forEach { element in
            welcomeStack.addArrangedSubview(element)
        }
        
        view.addSubview(welcomeStack)
        welcomeStack.pinHorizontal(to: view, Constant.WelcomeStack.horizontalOffset)
        welcomeStack.pinCenterY(to: view)
    }
    
    private func setUpReadMoreStackContent() {
        readMoreLabel.text = Constant.ReadMore.title
        readMoreLabel.font = Constant.ReadMore.titleFont
        readMoreLabel.textColor = Constant.ReadMore.titleTextColor
        
        readMoreButton.setTitle(Constant.ReadMore.buttonTitle, for: .normal)
        readMoreButton.titleLabel?.font = Constant.ReadMore.buttonFont
        readMoreButton.titleLabel?.textColor = Constant.ReadMore.buttonTextColor
        readMoreButton.setHeight(Constant.ReadMore.buttonHeight)
        readMoreButton.setWidth(Constant.ReadMore.buttonWidth)
        
        readMoreButton.addTarget(self, action: #selector(readMoreaction), for: .touchUpInside)
    }
    
    private func setUpReadMoreStack() {
        readMoreStack.axis = Constant.ReadMore.axis
        
        [readMoreLabel, readMoreButton].forEach { element in
            readMoreStack.addArrangedSubview(element)
        }
        
        view.addSubview(readMoreStack)
        readMoreStack.pinCenterX(to: view)
        readMoreStack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.ReadMore.bottomOffset)
    }
    
    // MARK: - Actions
    @objc
    private func readMoreaction() {
        interactor.loadReadMore()
    }
}
