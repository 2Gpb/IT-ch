//
//  ITCHNotificationsInteractor.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationsInteractor: NSObject, ITCHNotificationsBusinessLogic, ITCHNotificationsStorage {
    // MARK: - Private fields
    private let presenter: ITCHNotificationsPresentationLogic & ITCHNotificationsRouterLogic
    private let filters: [String] = ["Непрочитанные", "Новые записи", "Новые задания"]
    
    // MARK: - Variables
    var notifications: [ITCHNotificationModel] = [
        ITCHNotificationModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            notification: "Новое задание",
            date: Date(),
            isNewNotify: true
        ),
        ITCHNotificationModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            notification: "Новое задание",
            date: Date(),
            isNewNotify: true
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHNotificationsPresentationLogic & ITCHNotificationsRouterLogic) {
        self.presenter = presenter
    }
}

// MARK: - UICollectionViewDataSource
extension ITCHNotificationsInteractor: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ITCHNotificationsFilterCell.reuseId,
            for: indexPath
        ) as? ITCHNotificationsFilterCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: filters[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDataSource
extension ITCHNotificationsInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHNotificationCell.reuseId,
            for: indexPath
        ) as? ITCHNotificationCell else {
            return UITableViewCell()
        }
        
        let model = notifications[indexPath.row]
        let viewModel = ITCHNotificationViewModel(
            courseName: model.courseName,
            notification: model.notification,
            date: model.date,
            isNewNotify: model.isNewNotify
        )
        
        cell.configure(with: viewModel)
        
        return cell
    }
}
