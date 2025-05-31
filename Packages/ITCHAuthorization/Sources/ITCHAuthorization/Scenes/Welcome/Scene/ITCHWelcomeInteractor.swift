//
//  ITCHWelcomeInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import ITCHCore

final class ITCHWelcomeInteractor: ITCHWelcomeBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadSelectAccount() {
        presenter.routeToLogin()
        let serv = ITCHUserRoleService()
        let serv1 = ITCHSecureSessionService()
        
        print(serv.get())
        print(serv1.get()?.token)
        print(serv1.get()?.refreshToken)
    }
    
    func loadFullName() {
        presenter.routeToFullName()
    }
    
    func loadReadMore() {
        presenter.routeToReadMore()
    }
}
