//
//  ITCHHomeWorksViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHomeWorksViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title = "Домашние задания"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
            static let rightImage: UIImage = ITCHImage.plus24.image
        }
        
        enum HomeWorksTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHomeWorksBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let homeWorksTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHHomeWorksBusinessLogic) {
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
        view.backgroundColor = ITCHColor.backgroundDark.color
        setUpNavigationBar()
        setUpHomeWorksTableView()
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
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpHomeWorksTableView() {
        homeWorksTableView.dataSource = interactor
        homeWorksTableView.delegate = self
        homeWorksTableView.separatorStyle = Constant.HomeWorksTable.separatorStyle
        homeWorksTableView.backgroundColor = Constant.HomeWorksTable.backgroundColor
        homeWorksTableView.register(ITCHHomeWorkCell.self, forCellReuseIdentifier: ITCHHomeWorkCell.reuseId)
        
        view.addSubview(homeWorksTableView)
        homeWorksTableView.pinTop(to: navigationBar.bottomAnchor)
        homeWorksTableView.pinHorizontal(to: view)
        homeWorksTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHHomeWorksViewController: UITableViewDelegate { }
