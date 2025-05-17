//
//  ITCHAppearanceInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHAppearanceInteractor: NSObject, ITCHAppearanceBusinessLogic, ITCHThemeStorage, ITCHIconStorage {
    // MARK: - Private fields
    private let presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic
    private let themes: [ITCHThemeOption] = ITCHThemeOption.allCases
    private let icons: [ITCHIconOption] = ITCHIconOption.allCases
    
    // MARK: - Variables
    var currentThemeIndex: IndexPath = IndexPath(row: 0, section: 0)
    var currentIconIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - Lifecycle
    init(presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadChangeTheme(with index: Int) { }
    
    func loadChangeIcon(with index: Int) { }
}

// MARK: - UITableViewDataSource
extension ITCHAppearanceInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHThemeCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(with: themes[indexPath.row].title, isChecked: currentThemeIndex == indexPath)
    
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension ITCHAppearanceInteractor: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ITCHIconCell.reuseId,
            for: indexPath
        ) as? ITCHIconCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: icons[indexPath.row].image, isSelected: currentIconIndex == indexPath)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ITCHIconHeaderView.reuseId,
                for: indexPath
              ) as? ITCHIconHeaderView else {
            return UICollectionReusableView()
        }
        
        header.configure(with: icons[indexPath.row].title)
        
        return header
    }
}
