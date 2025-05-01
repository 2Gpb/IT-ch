//
//  ITCHNotificationTextInteractor.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

final class ITCHNotificationTextInteractor: ITCHNotificationTextBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHNotificationTextPresentationLogic & ITCHNotificationTextRouterLogic
    private let notifcationTextModel: ITCHNotificationTextModel
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHNotificationTextPresentationLogic & ITCHNotificationTextRouterLogic,
        model: ITCHNotificationTextModel
    ) {
        self.presenter = presenter
        self.notifcationTextModel = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: notifcationTextModel)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
