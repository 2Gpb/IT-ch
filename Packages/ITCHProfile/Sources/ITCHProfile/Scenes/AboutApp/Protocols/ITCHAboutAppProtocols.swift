//
//  ITCHAboutAppProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

protocol ITCHAboutAppBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadPage(with index: Int)
}

protocol ITCHAboutAppPresentationLogic { }

protocol ITCHAboutAppRouterLogic {
    func popViewController()
    func routeToFAQ()
    func routeToPrivacyPolicy()
    func routeToEvaluateApp()
}
