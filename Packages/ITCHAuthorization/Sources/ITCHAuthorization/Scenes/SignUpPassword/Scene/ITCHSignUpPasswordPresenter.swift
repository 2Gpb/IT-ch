//
//  ITCHSignUpPasswordPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHSignUpPasswordPresenter: ITCHSignUpPasswordPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSignUpPasswordViewController?
}

// MARK: - RouterLogic
extension ITCHSignUpPasswordPresenter: ITCHSignUpPasswordRouterLogic {
    func routeToEnterFullName() {
        view?.navigationController?.pushViewController(ITCHEnterFullNameAssembly.build(), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
