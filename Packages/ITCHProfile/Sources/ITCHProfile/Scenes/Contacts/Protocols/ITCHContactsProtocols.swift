//
//  ITCHContactsProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

protocol ITCHContactsBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadSocial(with index: Int)
}

protocol ITCHContactsPresentationLogic { }

protocol ITCHContactsRouterLogic {
    func popViewController()
    func routeToVK()
    func routeToTelegram()
    func routeToEmail()
}
