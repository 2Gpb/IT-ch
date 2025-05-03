//
//  ITCHAppearanceProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

protocol ITCHAppearanceBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadChangeTheme(with index: Int)
}

protocol ITCHAppearancePresentationLogic { }

protocol ITCHAppearanceRouterLogic {
    func popViewController()
}

protocol ITCHThemeStorage: AnyObject {
    var currentThemeIndex: IndexPath { get set }
}
