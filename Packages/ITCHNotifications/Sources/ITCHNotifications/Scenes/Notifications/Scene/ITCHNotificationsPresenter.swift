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
extension ITCHNotificationsPresenter: ITCHNotificationsRouterLogic {
    func routeToNotificationText(with model: ITCHNotificationModel) {
        view?.navigationController?.pushViewController(
            ITCHNotificationTextAssembly.build(
                with: ITCHNotificationTextModel(
                    title: model.title,
                    date: model.date,
                    text: model.text,
                    type: model.type
                )
            ),
            animated: true
        )
    }
}
