//
//  ITCHNotificationsProtocols.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit

protocol ITCHNotificationsBusinessLogic: UITableViewDataSource, UICollectionViewDataSource {
    func loadNotificationText()
}

protocol ITCHNotificationsPresentationLogic { }

protocol ITCHNotificationsRouterLogic {
    func routeToNotificationText()
}

protocol ITCHNotificationsStorage {
    var notifications: [ITCHNotificationModel] { get set }
}
