//
//  ITCHWelcomePresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

final class ITCHWelcomePresenter: ITCHWelcomePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHWelcomeViewController?
}

// MARK: - RouterLogic
extension ITCHWelcomePresenter: ITCHWelcomeRouterLogic {
    func routeToLogin() {
        view?.navigationController?.pushViewController(ITCHLoginAssembly.build(), animated: true)
    }
    
    func routeToFullName() {
        view?.navigationController?.pushViewController(ITCHFullNameAssembly.build(), animated: true)
    }
    
    func routeToReadMore() {
        view?.navigationController?.pushViewController(ITCHHelpQuestionsAssembly.build(), animated: true)
    }
}
