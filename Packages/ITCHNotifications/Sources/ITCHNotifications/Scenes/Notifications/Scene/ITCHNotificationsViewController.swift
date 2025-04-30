//
//  ITCHNotificationsViewController.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHNotificationsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
        }
        
        enum NavigationBar {
            static let title: String = "Уведомления"
        }
        
        enum Filters {
            static let titles: [String] = ["Непрочитанные", "Новые записи", "Новые задания"]
            static let backgroundColor: UIColor = .clear
            static let scrollEnable: Bool = false
            static let collectionHeight: CGFloat = 57
            static let interItemSpacing: CGFloat = 8
            static let scrollDirection: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous
            static let collectionInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(
                top: 12,
                leading: 16,
                bottom: 12,
                trailing: 16
            )
    
            static let cellSize: NSCollectionLayoutSize = NSCollectionLayoutSize(
                widthDimension: .estimated(100),
                heightDimension: .absolute(33)
            )
        }
        
        enum EmptyState {
            static let title: String = "У вас пока нет уведомлений"
            static let subTitle: String = "Мы обязательно дадим  вам знать,\nкогда они станут доступны."
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHNotificationsBusinessLogic
    private var selectedIndex: IndexPath?
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
    private var filtersCollectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Lifecycle
    init(interactor: ITCHNotificationsBusinessLogic) {
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
        setUpView()
        setUpNavigationBar()
        setUpEmptyStateView()
        setUpFiltersCollectionView()
    }
    
    private func setUpView() {
        view.backgroundColor = Constant.View.backgroundColor
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(with: ITCHNavigationBarModel(title: Constant.NavigationBar.title))
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpEmptyStateView() {
        emptyStateView.configure(
            title: Constant.EmptyState.title,
            subtitle: Constant.EmptyState.subTitle
        )
        
        view.addSubview(emptyStateView)
        emptyStateView.pinCenterY(to: view.centerYAnchor)
        emptyStateView.pinHorizontal(to: view)
    }
    
    private func setUpFiltersCollectionView() {
        filtersCollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: setUpFiltersCollectionLayout()
        )
        
        filtersCollectionView.delegate = self
        filtersCollectionView.dataSource = self
        filtersCollectionView.backgroundColor = Constant.Filters.backgroundColor
        filtersCollectionView.isScrollEnabled = Constant.Filters.scrollEnable
        filtersCollectionView.register(
            ITCHNotificationsFilterCell.self,
            forCellWithReuseIdentifier: ITCHNotificationsFilterCell.reuseId
        )
        
        view.addSubview(filtersCollectionView)
        filtersCollectionView.pinTop(to: navigationBar.bottomAnchor)
        filtersCollectionView.pinHorizontal(to: view)
        filtersCollectionView.setHeight(Constant.Filters.collectionHeight)
    }
    
    private func setUpFiltersCollectionLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = Constant.Filters.cellSize
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = Constant.Filters.cellSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Constant.Filters.interItemSpacing
        section.orthogonalScrollingBehavior = Constant.Filters.scrollDirection
        section.contentInsets = Constant.Filters.collectionInsets

        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDelegate
extension ITCHNotificationsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previous = selectedIndex
        selectedIndex = indexPath
        
        var indexPathsToReload = [indexPath]
        if let previous, previous != indexPath {
            indexPathsToReload.append(previous)
        }
        
        collectionView.reloadItems(at: indexPathsToReload)
    }
}

// MARK: - UICollectionViewDataSource
extension ITCHNotificationsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constant.Filters.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ITCHNotificationsFilterCell.reuseId,
            for: indexPath
        ) as? ITCHNotificationsFilterCell else {
            return UICollectionViewCell()
        }
        
        cell.wasSelected = indexPath == selectedIndex
        cell.configure(with: Constant.Filters.titles[indexPath.row])
        
        return cell
    }
}
