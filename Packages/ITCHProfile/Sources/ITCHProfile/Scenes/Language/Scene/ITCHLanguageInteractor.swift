//
//  ITCHLanguageInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHLanguageInteractor: NSObject, ITCHLanguageBusinessLogic, ITCHLanguageStorage {
    // MARK: - Private fields
    private let presenter: ITCHLanguagePresentationLogic & ITCHLanguageRouterLogic
    private let languages: [ITCHLanguageOption] = ITCHLanguageOption.allCases
    
    // MARK: - Variables
    var currentLanguageIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Lifecycle
    init(presenter: ITCHLanguagePresentationLogic & ITCHLanguageRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadChangeLanguage(with: Int) { }
}

// MARK: - UITableViewDataSource
extension ITCHLanguageInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHLanguageCell.reuseId
        ) as? ITCHLanguageCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: languages[indexPath.row].title, isChecked: currentLanguageIndex == indexPath)
        
        return cell
    }
}
