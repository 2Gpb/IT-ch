//
//  ITCHProfilePresenter.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import Foundation
import UIKit

final class ITCHProfilePresenter: ITCHProfilePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHProfileViewController?
    
    // MARK: - Private fields
    private let exitAction: () -> Void
    
    init(exitAction: @escaping () -> Void) {
        self.exitAction = exitAction
    }
    
    // MARK: - Methods
    func presentStart(with model: ITCHAccountModel) {
        view?.dispayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHProfilePresenter: ITCHProfileRouterLogic {
    func routeToAppearance() {
        view?.navigationController?.pushViewController(ITCHAppearanceAssembly.build(), animated: true)
    }
    
    func routeToLanguage() {
        view?.navigationController?.pushViewController(ITCHLanguageAssembly.build(), animated: true)
    }
    
    func routeToAboutApp() {
        view?.navigationController?.pushViewController(ITCHAboutAppAssembly.build(), animated: true)
    }
    
    func routeToContacts() {
        view?.navigationController?.pushViewController(ITCHContactsAssembly.build(), animated: true)
    }
    
    func routeToLogOut() {
        exitAction()
//        if let rootNav = view?.presentingViewController as? UINavigationController {
//            view?.dismiss(animated: false) {
//                let controllers = rootNav.viewControllers
//                
//                if controllers.count > 1 {
//                    let secondVC = controllers[1]
//                    DispatchQueue.main.async {
//                        rootNav.popToViewController(secondVC, animated: false)
////                        rootNav.setViewControllers([secondVC], animated: false)
//                    }
//                }
//            }
//        }
    }
}
