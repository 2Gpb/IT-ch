//
//  ITCHLanguageProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

protocol ITCHLanguageBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadChangeLanguage(with: Int)
}

protocol ITCHLanguagePresentationLogic { }

protocol ITCHLanguageRouterLogic {
    func popViewController()
}

protocol ITCHLanguageStorage: AnyObject {
    var currentLanguageIndex: IndexPath { get set }
}
