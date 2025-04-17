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
}

protocol ITCHSelectAccountPresentationLogic { }

@MainActor
protocol ITCHSelectAccountRouterLogic {
    func popViewController()
}

@MainActor
protocol ITCHAccountsStorage {
    var accounts: [ITCHAccountModel] { get }
}
