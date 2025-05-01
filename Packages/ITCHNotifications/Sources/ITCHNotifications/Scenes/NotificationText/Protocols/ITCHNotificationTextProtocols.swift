//
//  ITCHNotificationTextProtocols.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

protocol ITCHNotificationTextBusinessLogic {
    func loadStart()
    func loadDismiss()
}

protocol ITCHNotificationTextPresentationLogic {
    func presentStart(with model: ITCHNotificationTextModel)
}

protocol ITCHNotificationTextRouterLogic {
    func popViewController()
}
