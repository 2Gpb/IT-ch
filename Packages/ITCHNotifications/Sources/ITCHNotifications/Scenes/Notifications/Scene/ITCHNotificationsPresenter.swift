//
//  ITCHNotificationsPresenter.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

final class ITCHNotificationsPresenter: ITCHNotificationsPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHNotificationsViewController?
}

// MARK: - RouterLogic
extension ITCHNotificationsPresenter: ITCHNotificationsRouterLogic { }
