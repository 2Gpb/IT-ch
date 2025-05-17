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
        
        enum EmptyState {
            static let title: String = "У вас пока нет уведомлений"
            static let subTitle: String = "Мы обязательно дадим  вам знать,\nкогда они станут доступны."
        }
        
        enum Filters {
            static let backgroundColor: UIColor = .clear
            static let scrollEnable: Bool = false
            static let collectionHeight: CGFloat = 53
            static let interItemSpacing: CGFloat = 8
            static let scrollDirection: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous
            static let collectionInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(
                top: 12,
                leading: 16,
                bottom: 8,
                trailing: 16
            )
    
            static let cellSize: NSCollectionLayoutSize = NSCollectionLayoutSize(
                widthDimension: .estimated(100),
                heightDimension: .estimated(33)
            )
        }
        
        enum Notifications {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHNotificationsBusinessLogic & ITCHNotificationsStorage
    private var selectedIndex: IndexPath?
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
    private let notificationTableView: UITableView = UITableView()
    private let filtersCollectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Lifecycle
    init(interactor: ITCHNotificationsBusinessLogic & ITCHNotificationsStorage) {
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
        setUpNotificationsTableView()
    }
    
    private func setUpView() {
        navigationController?.isNavigationBarHidden = true
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
        
        emptyStateView.isHidden = !interactor.notifications.isEmpty
        
        view.addSubview(emptyStateView)
        emptyStateView.pinCenterY(to: view.centerYAnchor)
        emptyStateView.pinHorizontal(to: view)
    }
    
    private func setUpFiltersCollectionView() {
        filtersCollectionView.isHidden = interactor.notifications.isEmpty
        filtersCollectionView.delegate = self
        filtersCollectionView.dataSource = interactor
        filtersCollectionView.collectionViewLayout = setUpFiltersCollectionLayout()
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
    
    private func setUpNotificationsTableView() {
        notificationTableView.delegate = self
        notificationTableView.dataSource = interactor
        notificationTableView.separatorStyle = Constant.Notifications.separatorStyle
        notificationTableView.backgroundColor = Constant.Notifications.backgroundColor
        notificationTableView.register(
            ITCHNotificationCell.self,
            forCellReuseIdentifier: ITCHNotificationCell.reuseId
        )
        
        view.addSubview(notificationTableView)
        notificationTableView.pinTop(to: filtersCollectionView.bottomAnchor)
        notificationTableView.pinHorizontal(to: view)
        notificationTableView.pinBottom(to: view.bottomAnchor)
    }
}

// MARK: - UICollectionViewDelegate
extension ITCHNotificationsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previous = selectedIndex
        selectedIndex = selectedIndex == indexPath ? nil : indexPath
        
        if let previousCell = previous, previousCell != indexPath {
            if let cell = collectionView.cellForItem(at: previousCell) as? ITCHNotificationsFilterCell {
                cell.wasSelected.toggle()
            }
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ITCHNotificationsFilterCell {
            cell.wasSelected.toggle()
        }
    }
}

// MARK: - UITableViewDelegate
extension ITCHNotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.loadNotificationText(for: indexPath.row)
    }
}
