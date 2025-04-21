//
//  ITCHLoginPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import Foundation
import UIKit

final class ITCHLoginPresenter: ITCHLoginPresentationLogic {
    // MARK: - Constants
    private enum Constant {
        static let passwordRecoveryURLString = "https://lk.hse.ru/password_recovery"
    }
    
    // MARK: - Variables
    weak var view: ITCHLoginViewController?
}

// MARK: - RouterLogic
extension ITCHLoginPresenter: ITCHLoginRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToPasswordRecovery() {
        if let url = URL(string: Constant.passwordRecoveryURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
