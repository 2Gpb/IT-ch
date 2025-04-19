//
//  ITCHManageAccountsInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHManageAccountsInteractor: NSObject, ITCHManageAccountsBusinessLogic, ITCHManageAccountsStorage {
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
        
        cell.configure(with: accounts[indexPath.row])
        
        return cell
    }
}
