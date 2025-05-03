//
//  ITCHAppearanceProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

protocol ITCHAppearanceBusinessLogic: UITableViewDataSource, UICollectionViewDataSource {
    func loadDismiss()
    func loadChangeTheme(with index: Int)
    func loadChangeIcon(with index: Int)
}

protocol ITCHAppearancePresentationLogic { }

protocol ITCHAppearanceRouterLogic {
    func popViewController()
}

protocol ITCHThemeStorage: AnyObject {
    var currentThemeIndex: IndexPath { get set }
}

protocol ITCHIconStorage: AnyObject {
    var currentIconIndex: IndexPath { get set }
}
