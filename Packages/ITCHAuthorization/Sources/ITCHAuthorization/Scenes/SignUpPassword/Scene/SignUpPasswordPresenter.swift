//
//  SignUpPasswordPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class SignUpPasswordPresenter: SignUpPasswordPresentationLogic {
    // MARK: - Variables
    weak var view: SignUpPasswordViewController?
}

// MARK: - RouterLogic
extension SignUpPasswordPresenter: SignUpPasswordRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
