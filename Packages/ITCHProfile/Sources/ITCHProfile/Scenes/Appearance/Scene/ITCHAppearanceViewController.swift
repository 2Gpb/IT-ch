//
//  ITCHAppearanceViewController.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHAppearanceViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title = "Внешний вид"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum ThemesTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = false
            static let rowHeight: CGFloat = 44
            static let headerHeight: CGFloat = 28
            static let headerTitle: String = "ТЕМА"
            static let topOffset: CGFloat = 22
            static let numberThemes: CGFloat = 3
        }
        
        enum Separator {
            static let backgroundColor: UIColor = ITCHColor.base70.color
            static let topOffset: CGFloat = 12
            static let horizontalOffset: CGFloat = 16
            static let height: CGFloat = 1
        }
        
        enum IconsCollection {
            static let backgroundColor: UIColor = .clear
            static let topOffset: CGFloat = 20
            static let horizontalOffset: CGFloat = 16
            static let sizeForItem: CGSize = CGSize(width: 68, height: 68)
            static let headerHeight: CGFloat = 36
            static let lineSpacing: CGFloat = 16
            static let interItemSpacing: CGFloat = 0
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHAppearanceBusinessLogic & ITCHThemeStorage & ITCHIconStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let themesTableView: UITableView = UITableView()
    private let separatorView: UIView = UIView()
    private var iconsCollectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    // MARK: - Lifecycle
    init(interactor: ITCHAppearanceBusinessLogic & ITCHThemeStorage & ITCHIconStorage) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpThemesTableView()
        setUpSeparatorView()
        setUpIconsCollectionView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpThemesTableView() {
        themesTableView.isScrollEnabled = Constant.ThemesTable.isScrollEnabled
        themesTableView.separatorStyle = Constant.ThemesTable.separatorStyle
        themesTableView.backgroundColor = Constant.ThemesTable.backgroundColor
        themesTableView.dataSource = interactor
        themesTableView.delegate = self
        themesTableView.register(ITCHThemeCell.self, forCellReuseIdentifier: ITCHThemeCell.reuseId)
        
        view.addSubview(themesTableView)
        themesTableView.pinTop(to: navigationBar.bottomAnchor)
        themesTableView.pinHorizontal(to: view)
        themesTableView.setHeight(
            Constant.ThemesTable.rowHeight * Constant.ThemesTable.numberThemes +
            Constant.ThemesTable.headerHeight + Constant.ThemesTable.topOffset
        )
    }
    
    private func setUpSeparatorView() {
        separatorView.backgroundColor = Constant.Separator.backgroundColor
        
        view.addSubview(separatorView)
        separatorView.pinTop(to: themesTableView.bottomAnchor, Constant.Separator.topOffset)
        separatorView.pinHorizontal(to: view, Constant.Separator.horizontalOffset)
        separatorView.setHeight(Constant.Separator.height)
    }
    
    private func setUpIconsCollectionView() {
        iconsCollectionView.delegate = self
        iconsCollectionView.dataSource = interactor
        iconsCollectionView.backgroundColor = Constant.IconsCollection.backgroundColor
        iconsCollectionView.register(
            ITCHIconHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ITCHIconHeaderView.reuseId
        )
        
        iconsCollectionView.register(ITCHIconCell.self, forCellWithReuseIdentifier: ITCHIconCell.reuseId)
        
        view.addSubview(iconsCollectionView)
        iconsCollectionView.pinTop(to: separatorView.bottomAnchor, Constant.IconsCollection.topOffset)
        iconsCollectionView.pinHorizontal(to: view, Constant.IconsCollection.horizontalOffset)
        iconsCollectionView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHAppearanceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let previous = interactor.currentThemeIndex
        interactor.currentThemeIndex = indexPath

        if let cell = tableView.cellForRow(at: previous) as? ITCHThemeCell {
            cell.isCheck = false
        }
        
        if let cell = tableView.cellForRow(at: indexPath) as? ITCHThemeCell {
            cell.isCheck = true
        }
        
        interactor.loadChangeTheme(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.ThemesTable.rowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ITCHThemeHeaderView(with: Constant.ThemesTable.headerTitle)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constant.ThemesTable.headerHeight
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ITCHAppearanceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previous = interactor.currentIconIndex
        interactor.currentIconIndex = indexPath

        if let cell = collectionView.cellForItem(at: previous) as? ITCHIconCell {
            cell.wasSelected = false
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ITCHIconCell {
            cell.wasSelected = true
        }
        
        interactor.loadChangeIcon(with: indexPath.row)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        Constant.IconsCollection.sizeForItem
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(
            width: iconsCollectionView.bounds.width,
            height: Constant.IconsCollection.headerHeight
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        Constant.IconsCollection.lineSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        Constant.IconsCollection.interItemSpacing
    }
}
