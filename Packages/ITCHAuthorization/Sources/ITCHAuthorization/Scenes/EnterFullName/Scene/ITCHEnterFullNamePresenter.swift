//
//  EnterFullNamePresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHEnterFullNamePresenter: ITCHEnterFullNamePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHEnterFullNameViewController?
}

// MARK: - RouterLogic
extension ITCHEnterFullNamePresenter: ITCHEnterFullNameRouterLogic {
    func routeToCourses() {
//        view?.navigationController?.pushViewController(ITCHTabBarController(), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
