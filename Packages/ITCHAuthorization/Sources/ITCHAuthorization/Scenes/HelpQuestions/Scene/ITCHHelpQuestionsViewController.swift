//
//  ITCHHelpQuestionsViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHelpQuestionsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHelpQuestionsBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    
    // MARK: - Lifecycle
    init(interactor: ITCHHelpQuestionsBusinessLogic) {
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
    }
    
    private func setUpView() {
        view.backgroundColor = ITCHColor.backgroundGray.color
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: "F.A.Q.",
                leftImage: ITCHImage.chevronLeft24.image
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
