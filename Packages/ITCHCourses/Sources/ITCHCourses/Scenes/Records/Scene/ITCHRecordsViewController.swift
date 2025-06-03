//
//  ITCHRecordsViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

final class ITCHRecordsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
        }
        
        enum NavigationBar {
            static let title = "Записи"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
            static let rightImage: UIImage = ITCHImage.plus24.image
        }
        
        enum EmptyState {
            static let title: String = "На курсе пока нет записей"
            static let subtitle: String = "Добавьте первую запись, нажав на плюс\nв правом верхнем углу."
        }
        
        enum RecordsTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let bottomInset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHRecordsBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
    private let recordsTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHRecordsBusinessLogic) {
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
        interactor.loadStart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.loadRecords()
    }
    
    // MARK: - Methods
    func displayStart(for role: ITCHCourseUserRole) {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage,
                rightImage: role == .teacher ? Constant.NavigationBar.rightImage : nil
            )
        )
    }
    
    func displayRecords(isEmpty: Bool) {
        emptyStateView.isHidden = !isEmpty
        recordsTableView.reloadData()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpEmptyStateView()
        setUpRecordsTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.rightAction = { [weak self] in
            self?.interactor.loadAddRecord()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpEmptyStateView() {
        emptyStateView.configure(
            title: Constant.EmptyState.title,
            subtitle: Constant.EmptyState.subtitle
        )
        
        view.addSubview(emptyStateView)
        emptyStateView.pinCenterY(to: view.centerYAnchor)
        emptyStateView.pinHorizontal(to: view)
    }
    
    private func setUpRecordsTableView() {
        recordsTableView.dataSource = interactor
        recordsTableView.delegate = self
        recordsTableView.separatorStyle = Constant.RecordsTable.separatorStyle
        recordsTableView.backgroundColor = Constant.RecordsTable.backgroundColor
        recordsTableView.showsVerticalScrollIndicator = false
        recordsTableView.contentInset.bottom = Constant.RecordsTable.bottomInset
        recordsTableView.register(ITCHRecordCell.self, forCellReuseIdentifier: ITCHRecordCell.reuseId)
        
        view.addSubview(recordsTableView)
        recordsTableView.pinTop(to: navigationBar.bottomAnchor)
        recordsTableView.pinHorizontal(to: view)
        recordsTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHRecordsViewController: UITableViewDelegate { }
