//
//  ITCHNotificationTextPresenter.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

final class ITCHNotificationTextPresenter: ITCHNotificationTextPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHNotificationTextViewController?
    
    // MARK: - Methods
    func presentStart(with model: ITCHNotificationTextModel) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHNotificationTextPresenter: ITCHNotificationTextRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
