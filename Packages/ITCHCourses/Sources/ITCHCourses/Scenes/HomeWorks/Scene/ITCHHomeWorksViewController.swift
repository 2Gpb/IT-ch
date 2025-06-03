//
//  ITCHHomeWorksViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

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
        
        enum EmptyState {
            static let title: String = "На курсе пока нет заданий"
            static let subtitle: String = "Добавьте первое задание, нажав на плюс\nв правом верхнем углу."
        }
        
        enum HomeWorksTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let bottomInset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHomeWorksBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.loadStart()
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
    
    func displayHomeWorks(isEmpty: Bool) {
        emptyStateView.isHidden = !isEmpty
        homeWorksTableView.reloadData()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundDark.color
        setUpNavigationBar()
        setUpEmptyStateView()
        setUpHomeWorksTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.rightAction = { [weak self] in
            self?.interactor.loadAddHomeWork()
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
    
    private func setUpHomeWorksTableView() {
        homeWorksTableView.dataSource = interactor
        homeWorksTableView.delegate = self
        homeWorksTableView.separatorStyle = Constant.HomeWorksTable.separatorStyle
        homeWorksTableView.backgroundColor = Constant.HomeWorksTable.backgroundColor
        homeWorksTableView.showsVerticalScrollIndicator = false
        homeWorksTableView.contentInset.bottom = Constant.HomeWorksTable.bottomInset
        homeWorksTableView.register(ITCHHomeWorkCell.self, forCellReuseIdentifier: ITCHHomeWorkCell.reuseId)
        
        view.addSubview(homeWorksTableView)
        homeWorksTableView.pinTop(to: navigationBar.bottomAnchor)
        homeWorksTableView.pinHorizontal(to: view)
        homeWorksTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHHomeWorksViewController: UITableViewDelegate { }
