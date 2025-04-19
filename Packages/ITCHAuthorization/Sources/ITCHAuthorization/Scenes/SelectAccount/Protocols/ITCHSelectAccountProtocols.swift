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
}

protocol ITCHSelectAccountPresentationLogic { }

@MainActor
protocol ITCHSelectAccountRouterLogic {
    func popViewController()
    func routeToManageAccounts()
}

@MainActor
protocol ITCHAccountsStorage {
    var accounts: [ITCHAccountModel] { get }
}
