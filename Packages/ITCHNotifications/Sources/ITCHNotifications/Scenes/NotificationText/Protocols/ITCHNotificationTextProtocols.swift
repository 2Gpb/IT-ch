//
//  ITCHNotificationTextProtocols.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

protocol ITCHNotificationTextBusinessLogic {
    func loadDismiss()
}

protocol ITCHNotificationTextPresentationLogic { }

protocol ITCHNotificationTextRouterLogic {
    func popViewController()
}
