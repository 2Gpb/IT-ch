//
//  ITCHSelectAccountInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSelectAccountInteractor: NSObject, ITCHSelectAccountBusinessLogic, ITCHAccountsStorage {
    // MARK: - Private fields
    private let presenter: ITCHSelectAccountPresentationLogic & ITCHSelectAccountRouterLogic
    
    // MARK: - Variables
    var accounts: [ITCHAccountModel] = [
        ITCHAccountModel(
            image: nil,
            name: "Тюхменев Петр Вячеславович",
            info: "Бакалавриат 21 ПИ-3"
        ),
        ITCHAccountModel(
            image: nil,
            name: "Тюхменев Петр Вячеславович",
            info: "Бакалавриат 21 ПИ-3"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHSelectAccountPresentationLogic & ITCHSelectAccountRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}

// MARK: - UICollectionViewDataSource
extension ITCHSelectAccountInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHAccountCell.reuseId
        ) as? ITCHAccountCell else {
            return UITableViewCell()
        }
        
        cell.configure(
            with: ITCHUserModel(
                image: accounts[0].image,
                name: accounts[0].name,
                info: accounts[0].info
            )
        )
        
        return cell
    }
}
