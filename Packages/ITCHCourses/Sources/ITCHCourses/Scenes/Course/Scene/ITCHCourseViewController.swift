//
//  ITCHCourseViewController.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCourseViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title: String = "Текущий курс"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
            static let rightImage: UIImage = ITCHImage.options24.image
        }
        
        enum CourseTable {
            static let backgroundColor: UIColor = .clear
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let bottomInset: CGFloat = 8
        }
        
        enum ContextActions {
            static let changeCourseTitle: String = "Изменить курс"
            static let changeCourseImage: UIImage = ITCHImage.pen20.image
            static let changeScheduleTitle: String = "Изменить расписание"
            static let changeScheduleImage: UIImage = ITCHImage.calendar20.image
            static let deleteTitle: String = "Удалить"
            static let deleteImage: UIImage = ITCHImage.trash20.image
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCourseBusinessLogic & ITCHCourseRoleStorage
    private let titles = ["КУРС", "ПРЕПОДАВАТЕЛЬ", "ОБЩАЯ ИНФОРМАЦИЯ", "ВАША РОЛЬ"]
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let courseTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHCourseBusinessLogic & ITCHCourseRoleStorage) {
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        courseTableView.isScrollEnabled = courseTableView.contentSize.height > courseTableView.frame.height
    }
    
    // MARK: - Methods
    func displayStart() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage,
                rightImage: interactor.role == .teacher ? Constant.NavigationBar.rightImage : nil
            )
        )
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpInfoTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.configureRightButtonMenu(
            items: [
                changeCourseAction(),
                changeScheduleAction(),
                deleteAction()
            ]
        )
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpInfoTableView() {
        courseTableView.delegate = self
        courseTableView.dataSource = interactor
        courseTableView.showsVerticalScrollIndicator = false
        courseTableView.backgroundColor = Constant.CourseTable.backgroundColor
        courseTableView.separatorStyle = Constant.CourseTable.separatorStyle
        courseTableView.contentInset.bottom = Constant.CourseTable.bottomInset
        courseTableView.register(ITCHTitleCell.self, forCellReuseIdentifier: ITCHTitleCell.reuseId)
        courseTableView.register(ITCHTeacherCell.self, forCellReuseIdentifier: ITCHTeacherCell.reuseId)
        courseTableView.register(ITCHNavigationRowCell.self, forCellReuseIdentifier: ITCHNavigationRowCell.reuseId)
        
        view.addSubview(courseTableView)
        courseTableView.pinTop(to: navigationBar.bottomAnchor)
        courseTableView.pinHorizontal(to: view)
        courseTableView.pinBottom(to: view)
    }
    
    // MARK: - Actions
    private func changeCourseAction() -> UIAction {
        UIAction(
            title: Constant.ContextActions.changeCourseTitle,
            image: Constant.ContextActions.changeCourseImage
        ) { [weak self] _ in
            self?.interactor.loadChangeCourse()
        }
    }
    
    private func changeScheduleAction() -> UIAction {
        UIAction(
            title: Constant.ContextActions.changeScheduleTitle,
            image: Constant.ContextActions.changeScheduleImage
        ) { [weak self] _ in
            self?.interactor.loadChangeSchedule()
        }
    }
    
    private func deleteAction() -> UIAction {
        UIAction(
            title: Constant.ContextActions.deleteTitle,
            image: Constant.ContextActions.deleteImage,
            attributes: .destructive
        ) { [weak self] _ in
            self?.interactor.loadDismiss()
        }
    }
}

// MARK: - UITableViewDelegate
extension ITCHCourseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section), section == .actions else { return }
        guard let action = ITCHCurrentCourseAction.action(for: indexPath, role: interactor.role) else { return }
        
        switch action {
        case .chat:
            interactor.loadChat()
        case .grades:
            interactor.loadGrades()
        case .members:
            interactor.loadMembers()
        case .recordings:
            interactor.loadRecords()
        case .homework:
            interactor.loadHomeWorks()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let type = ITCHCurrentCourseSection(rawValue: section) else { return nil }
        
        return type == .actions ? ITCHCourseHeaderView() : ITCHCourseHeaderView(with: titles[section])
    }
}
