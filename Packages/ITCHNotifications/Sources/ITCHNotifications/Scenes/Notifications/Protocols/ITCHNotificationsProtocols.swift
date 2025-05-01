//
//  ITCHNotificationsProtocols.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit

protocol ITCHNotificationsBusinessLogic: UITableViewDataSource, UICollectionViewDataSource {
    func loadNotificationText(for index: Int)
}

protocol ITCHNotificationsPresentationLogic { }

protocol ITCHNotificationsRouterLogic {
    func routeToNotificationText(with model: ITCHNotificationModel)
}

protocol ITCHNotificationsStorage {
    var notifications: [ITCHNotificationModel] { get set }
}
