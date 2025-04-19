//
//  ITCHSelectAccountProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

@MainActor
protocol ITCHSelectAccountBusinessLogic: UITableViewDataSource {
    func loadDismiss()
    func loadManageAccounts()
    func loadHelpQuestions()
}

protocol ITCHSelectAccountPresentationLogic { }

@MainActor
protocol ITCHSelectAccountRouterLogic {
    func popViewController()
    func routeToManageAccounts()
    func routeToHelpQuestions()
}

@MainActor
protocol ITCHAccountsStorage {
    var accounts: [ITCHAccountModel] { get }
}
