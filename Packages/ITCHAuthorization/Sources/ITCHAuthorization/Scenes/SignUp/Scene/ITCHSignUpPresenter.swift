//
//  ITCHSignUpPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHSignUpPresenter: ITCHSignUpPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSignUpViewController?
}

// MARK: - RouterLogic
extension ITCHSignUpPresenter: ITCHSignUpRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
