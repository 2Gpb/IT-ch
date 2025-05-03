//
//  ITCHInfoViewController.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHInfoViewController: UIViewController {
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
        
        enum Text {
            static let defaultText: String = "\n"
            static let backgroundColor: UIColor = .clear
            static let textColor: UIColor = ITCHColor.base0.color
            static let font: UIFont = ITCHFont.bodyMMedium.font
            static let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHInfoBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let textView: UITextView = UITextView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHInfoBusinessLogic) {
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
    func displayStart(with model: ITCHInfoModel) {
        navigationBar
            .configure(
                with: ITCHNavigationBarModel(
                    title: model.title,
                    leftImage: Constant.NavigationBar.leftImage
                )
            )
        
        textView.text += model.body
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpTextView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpTextView() {
        textView.text = Constant.Text.defaultText
        textView.backgroundColor = Constant.Text.backgroundColor
        textView.textColor = Constant.Text.textColor
        textView.font = Constant.Text.font
        textView.textContainerInset = Constant.Text.insets
        
        view.addSubview(textView)
        textView.pinTop(to: navigationBar.bottomAnchor)
        textView.pinHorizontal(to: view)
        textView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
