//
//  ITCHMyCoursesViewController.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

final class ITCHMyCoursesViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundDark.color
        }
        
        enum EmptyState {
            static let title: String = "У вас пока нет курсов"
            static let subtitle: String = "Создайте свой первый курс, нажав\nна плюс в правом верхнем углу."
        }
        
        enum NavigationBar {
            static let title: String = "Мои курсы"
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
    func displayStart(with role: ITCHUserRole?) {
        emptyStateView.isHidden = !interactor.courses.isEmpty
        
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                rightImage: role == .teacher ? Constant.NavigationBar.rightImage : nil
            )
        )
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
        navigationBar.rightAction = { [weak self] in
            self?.interactor.loadCreateCourse()
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
extension ITCHMyCoursesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.loadCourse(for: indexPath.row)
    }
}
