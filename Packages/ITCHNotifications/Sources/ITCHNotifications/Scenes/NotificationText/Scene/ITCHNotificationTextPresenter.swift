//
//  ITCHNotificationTextPresenter.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

final class ITCHNotificationTextPresenter: ITCHNotificationTextPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHNotificationTextViewController?
}

// MARK: - RouterLogic
extension ITCHNotificationTextPresenter: ITCHNotificationTextRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
