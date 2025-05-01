//
//  ITCHNotificationTextViewController.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationTextViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHNotificationTextBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    
    // MARK: - Lifecycle
    init(interactor: ITCHNotificationTextBusinessLogic) {
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
    
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundDark.color
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: "Новое задание",
                leftImage: ITCHImage.chevronLeft24.image,
                rightImage: ITCHImage.options24.image
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
