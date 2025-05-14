//
//  ITCHRecordsViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

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
        
        enum RecordsTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHRecordsBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
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
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpRecordsTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage,
                rightImage: Constant.NavigationBar.rightImage
            )
        )
        
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
    
    private func setUpRecordsTableView() {
        recordsTableView.dataSource = interactor
        recordsTableView.delegate = self
        recordsTableView.separatorStyle = Constant.RecordsTable.separatorStyle
        recordsTableView.backgroundColor = Constant.RecordsTable.backgroundColor
        recordsTableView.register(ITCHRecordCell.self, forCellReuseIdentifier: ITCHRecordCell.reuseId)
        
        view.addSubview(recordsTableView)
        recordsTableView.pinTop(to: navigationBar.bottomAnchor)
        recordsTableView.pinHorizontal(to: view)
        recordsTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHRecordsViewController: UITableViewDelegate { }
