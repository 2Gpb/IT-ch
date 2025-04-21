//
//  ITCHLoginPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import Foundation
import UIKit

final class ITCHLoginPresenter: ITCHLoginPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHLoginViewController?
}

// MARK: - RouterLogic
extension ITCHLoginPresenter: ITCHLoginRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToPasswordRecovery() {
        if let url = URL(string: "https://lk.hse.ru/password_recovery") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
