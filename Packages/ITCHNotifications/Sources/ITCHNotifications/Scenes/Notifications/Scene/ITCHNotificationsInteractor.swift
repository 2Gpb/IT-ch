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
            title: "Новое задание",
            date: Date(),
            text: """
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлено новое задание!
            
            Загляните в раздел с заданиями, чтобы прокачать свои навыки и узнать что-то новое.
            """,
            type: .task,
            isNewNotify: true
        ),
        ITCHNotificationModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            title: "Новая запись",
            date: Date(),
            text: """
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлена новоая запись!
            
            Посмотрите занятие еще раз, если необходимо освежить знания.
            
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлена новоая запись!
            
            Посмотрите занятие еще раз, если необходимо освежить знания.
            
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлена новоая запись!
            
            Посмотрите занятие еще раз, если необходимо освежить знания.
            
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлена новоая запись!
            
            Посмотрите занятие еще раз, если необходимо освежить знания.
            
            Доброго времени суток!
            
            В курс НИC "Основы iOS разработки на UIKit" добавлена новоая запись!
            
            Посмотрите занятие еще раз, если необходимо освежить знания.
            """,
            type: .record,
            isNewNotify: true
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHNotificationsPresentationLogic & ITCHNotificationsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadNotificationText(for index: Int) {
        presenter.routeToNotificationText(with: notifications[index])
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
            notification: model.title,
            date: model.date,
            isNewNotify: model.isNewNotify
        )
        
        cell.configure(with: viewModel)
        
        return cell
    }
}
