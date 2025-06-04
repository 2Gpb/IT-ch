//
//  ITCHFullNamePresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHFullNamePresenter: ITCHFullNamePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHFullNameViewController?
}

// MARK: - RouterLogic
extension ITCHFullNamePresenter: ITCHFullNameRouterLogic {
    func routeToSignUp(with fullName: String) {
        view?.navigationController?.pushViewController(ITCHSignUpAssembly.build(with: fullName), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
