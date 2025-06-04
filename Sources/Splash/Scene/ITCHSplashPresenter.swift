//
//  ITCHSplashPresenter.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import UIKit
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
        let tabBar = ITCHTabBarController(exitAction: {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = scene.windows.first {
                window.rootViewController = UINavigationController(rootViewController: ITCHWelcomeAssembly.build())
                window.makeKeyAndVisible()
            }
        })
        
        tabBar.modalPresentationStyle = .overFullScreen
        view?.present(tabBar, animated: true)
    }
}
