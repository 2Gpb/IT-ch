//
//  ITCHSignUpPasswordPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import ITCHControllers
import UIKit

final class ITCHSignUpPasswordPresenter: ITCHSignUpPasswordPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSignUpPasswordViewController?
}

// MARK: - RouterLogic
extension ITCHSignUpPasswordPresenter: ITCHSignUpPasswordRouterLogic {
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
}
