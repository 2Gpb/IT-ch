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
    func routeToSelectAccount() {
        view?.navigationController?.pushViewController(ITCHSelectAccountAssembly.build(), animated: true)
    }
    
    func routeToSignUp() {
        view?.navigationController?.pushViewController(ITCHSignUpAssembly.build(), animated: true)
    }
    
    func routeToReadMore() {
        view?.navigationController?.pushViewController(ITCHHelpQuestionsAssembly.build(), animated: true)
    }
}
