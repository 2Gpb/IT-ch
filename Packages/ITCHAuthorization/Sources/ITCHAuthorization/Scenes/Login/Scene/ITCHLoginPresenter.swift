//
//  ITCHLoginPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHControllers

final class ITCHLoginPresenter: ITCHLoginPresentationLogic {
    // MARK: - Constants
    private enum Constant {
        static let passwordRecoveryURLString = "https://lk.hse.ru/password_recovery"
    }
    
    // MARK: - Variables
    weak var view: ITCHLoginViewController?
    
    // MARK: - Methods
    func presentError() {
        view?.showErrorAnimated()
    }
}

// MARK: - RouterLogic
extension ITCHLoginPresenter: ITCHLoginRouterLogic {
    func routeToCourses() {
        let tabBar = ITCHTabBarController(exitAction: {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first {
                window.rootViewController = UINavigationController(rootViewController: ITCHWelcomeAssembly.build())
                window.makeKeyAndVisible()
            }
        })
        tabBar.modalPresentationStyle = .fullScreen
        view?.present(tabBar, animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToPasswordRecovery() {
        Constant.passwordRecoveryURLString.openURL()
    }
}
