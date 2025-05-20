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
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSignUpBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    
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
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
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
}
