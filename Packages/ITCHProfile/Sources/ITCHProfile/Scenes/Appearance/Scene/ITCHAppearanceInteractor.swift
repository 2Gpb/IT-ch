//
//  ITCHAppearanceInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHAppearanceInteractor: NSObject, ITCHAppearanceBusinessLogic, ITCHThemeStorage {
    // MARK: - Private fields
    private let presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic
    private let themes: [ITCHThemeOption] = ITCHThemeOption.allCases
    
    var currentThemeIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Lifecycle
    init(presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadChangeTheme(with index: Int) { }
}

// MARK: - UITableViewDataSource
extension ITCHAppearanceInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHThemeCell.reuseId
        ) as? ITCHThemeCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: themes[indexPath.row].title, isChecked: currentThemeIndex == indexPath)
    
        return cell
    }
}
