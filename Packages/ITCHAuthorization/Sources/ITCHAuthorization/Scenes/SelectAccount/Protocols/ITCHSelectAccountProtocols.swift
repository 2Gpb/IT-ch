//
//  ITCHSelectAccountProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

protocol ITCHSelectAccountBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadManageAccounts()
    func loadHelpQuestions()
    func loadLogin()
}

protocol ITCHSelectAccountPresentationLogic { }

protocol ITCHSelectAccountRouterLogic {
    func popViewController()
    func routeToManageAccounts()
    func routeToHelpQuestions()
    func routeToLogin()
}

protocol ITCHAccountsStorage {
    var accounts: [ITCHAccountModel] { get }
}
