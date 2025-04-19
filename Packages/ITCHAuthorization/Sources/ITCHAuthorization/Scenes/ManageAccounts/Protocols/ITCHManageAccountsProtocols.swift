//
//  ITCHManageAccountsProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

protocol ITCHManageAccountsBusinessLogic: UITableViewDataSource { }

protocol ITCHManageAccountsPresentationLogic { }

protocol ITCHManageAccountsRouterLogic { }

@MainActor
protocol ITCHManageAccountsStorage {
    var accounts: [ITCHAccountModel] { get }
}
