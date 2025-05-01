//
//  ITCHNotificationTextInteractor.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

final class ITCHNotificationTextInteractor: ITCHNotificationTextBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHNotificationTextPresentationLogic & ITCHNotificationTextRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHNotificationTextPresentationLogic & ITCHNotificationTextRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
