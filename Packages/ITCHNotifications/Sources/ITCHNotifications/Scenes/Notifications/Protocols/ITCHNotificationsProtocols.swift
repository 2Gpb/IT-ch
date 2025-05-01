//
//  ITCHNotificationsProtocols.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit

protocol ITCHNotificationsBusinessLogic: UITableViewDataSource, UICollectionViewDataSource { }

protocol ITCHNotificationsPresentationLogic { }

protocol ITCHNotificationsRouterLogic { }

protocol ITCHNotificationsStorage {
    var notifications: [ITCHNotificationModel] { get set }
}
