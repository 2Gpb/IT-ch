//
//  ITCHNotificationsViewController.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit

final class ITCHNotificationsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHNotificationsBusinessLogic
    
    // MARK: - UI Components
    
    // MARK: - Lifecycle
    init(interactor: ITCHNotificationsBusinessLogic) {
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
        view.backgroundColor = .red
    }
}
