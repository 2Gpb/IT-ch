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
    
    func loadManageAccounts() {
        presenter.routeToManageAccounts()
    }
    
    func loadHelpQuestions() {
        presenter.routeToHelpQuestions()
    }
    
    func loadLogin() {
        presenter.routeToLogin()
    }
}

// MARK: - UITableViewDataSource
extension ITCHSelectAccountInteractor: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        ITCHAccountsCollectionSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = ITCHAccountsCollectionSection.allCases[section]
        
        switch section {
        case .account:
            return accounts.count
        case .addAccount:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ITCHAccountsCollectionSection.allCases[indexPath.section]
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHAccountCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHAccountCell else {
            return rawCell
        }
        
        switch section {
        case .account:
            cell.configure(
                with: ITCHAccountModel(
                    image: accounts[indexPath.row].image,
                    name: accounts[indexPath.row].name,
                    info: accounts[indexPath.row].info
                ), type: .account
            )
            
            return cell
        case .addAccount:
            cell.configure(type: .addAccount)
            
            return cell
        }
    }
}
