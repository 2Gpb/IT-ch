//
//  ITCHWelcomeInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

final class ITCHWelcomeInteractor: ITCHWelcomeBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadSelectAccount() {
        presenter.routeToSelectAccount()
    }
    
    func loadFullName() {
        presenter.routeToFullName()
    }
    
    func loadReadMore() {
        presenter.routeToReadMore()
    }
}
