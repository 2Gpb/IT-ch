//
//  ITCHContactsPresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import Foundation
import UIKit

final class ITCHContactsPresenter: ITCHContactsPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHContactsViewController?
}

// MARK: - RouterLogic
extension ITCHContactsPresenter: ITCHContactsRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routetoVK() {
        ITCHContactsLinks.vk.openURL()
    }
    
    func routetoTelegram() {
        ITCHContactsLinks.telegram.openURL()
    }
    
    func routetoEmail() {
        ITCHContactsLinks.email.openURL()
    }
}
