//
//  ITCHManageAccountsInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHManageAccountsInteractor: NSObject, ITCHManageAccountsBusinessLogic, ITCHAccountsStorage {
    // MARK: - Private fields
    private let presenter: ITCHManageAccountsPresentationLogic & ITCHManageAccountsRouterLogic
    
    // MARK: - Variables
    var accounts: [ITCHAccountModel] = [
        ITCHAccountModel(
            image: nil,
            name: "Тюхменев Петр Вячеславович",
            info: "Бакалавриат 21 ПИ-3"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHManageAccountsPresentationLogic & ITCHManageAccountsRouterLogic) {
        self.presenter = presenter
    }
}

// MARK: - UITableViewDataSource
extension ITCHManageAccountsInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHManageAccountCell.reuseId
        ) as? ITCHManageAccountCell else {
            return UITableViewCell()
        }
        
        cell.configure(
            with: ITCHAccountViewModel(
                image: accounts[indexPath.row].image,
                name: accounts[indexPath.row].name,
                info: accounts[indexPath.row].info
            )
        )
        
        return cell
    }
}
