//
//  ITCHLoginPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

final class ITCHLoginPresenter: ITCHLoginPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHLoginViewController?
}

// MARK: - RouterLogic
extension ITCHLoginPresenter: ITCHLoginRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
