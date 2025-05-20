//
//  ITCHSignUpPasswordPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import ITCHControllers

final class ITCHSignUpPasswordPresenter: ITCHSignUpPasswordPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSignUpPasswordViewController?
}

// MARK: - RouterLogic
extension ITCHSignUpPasswordPresenter: ITCHSignUpPasswordRouterLogic {
    func routeToCourses() {
        let tabBar = ITCHTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        view?.present(tabBar, animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
