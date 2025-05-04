//
//  ITCHMyCoursesViewController.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHMyCoursesViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
        }
        
        enum NavigationBar {
            static let title: String = "My courses"
            static let rightImage: UIImage = ITCHImage.plus24.image
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHMyCoursesBusinessLogic & ITCHCoursesStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
    private let coursesTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHMyCoursesBusinessLogic & ITCHCoursesStorage) {
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
    
    // MARK: - Methods
    func displayStart() {
        emptyStateView.isHidden = !interactor.courses.isEmpty
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = Constant.View.backgroundColor
        navigationController?.navigationBar.isHidden = true
        setUpNavigationBar()
        setUpEmptyStateView()
        setUpCoursesTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                rightImage: Constant.NavigationBar.rightImage
            )
        )
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpEmptyStateView() {
        emptyStateView.configure(
            title: "У вас пока нет курсов",
            subtitle: "Создайте свой первый курс, нажав\nна плюс в правом верхнем углу."
        )
        
        view.addSubview(emptyStateView)
        emptyStateView.pinCenterY(to: view.centerYAnchor)
        emptyStateView.pinHorizontal(to: view)
    }
    
    private func setUpCoursesTableView() {
        coursesTableView.delegate = self
        coursesTableView.dataSource = interactor
        coursesTableView.backgroundColor = .clear
        coursesTableView.separatorStyle = .none
        coursesTableView.register(ITCHCourseCell.self, forCellReuseIdentifier: ITCHCourseCell.reuseId)
        
        view.addSubview(coursesTableView)
        coursesTableView.pinTop(to: navigationBar.bottomAnchor)
        coursesTableView.pinHorizontal(to: view)
        coursesTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHMyCoursesViewController: UITableViewDelegate { }
