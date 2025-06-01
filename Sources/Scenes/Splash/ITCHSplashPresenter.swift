//
//  ITCHSplashPresenter.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import ITCHControllers
import ITCHAuthorization

final class ITCHSplashPresenter: ITCHSplashPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSplashViewController?
}

// MARK: - RouterLogic
extension ITCHSplashPresenter: ITCHSplashRouterLogic {
    func routeToAuth() {
        view?.navigationController?.pushViewController(ITCHWelcomeAssembly.build(), animated: true)
    }
    
    func routeToCourses() {
        let tabBar = ITCHTabBarController()
        tabBar.modalPresentationStyle = .overFullScreen
        view?.present(tabBar, animated: true)
    }
}
