//
//  ITCHNotificationsInteractor.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

final class ITCHNotificationsInteractor: ITCHNotificationsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHNotificationsPresentationLogic & ITCHNotificationsRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHNotificationsPresentationLogic & ITCHNotificationsRouterLogic) {
        self.presenter = presenter
    }
}
