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
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCourseBusinessLogic
    private let titles = ["КУРС", "ПРЕПОДАВАТЕЛЬ", "ОБЩАЯ ИНФОРМАЦИЯ", "ВАША РОЛЬ"]
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let infoTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHCourseBusinessLogic) {
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
        
        infoTableView.isScrollEnabled = infoTableView.contentSize.height > infoTableView.frame.height
    }
    
    // MARK: - Methods
    func displayStart() { }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpInfoTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: "Текущий курс",
                leftImage: ITCHImage.chevronLeft24.image,
                rightImage: ITCHImage.options24.image
            )
        )
        
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
        infoTableView.delegate = self
        infoTableView.dataSource = interactor
        infoTableView.backgroundColor = .clear
        infoTableView.separatorStyle = .none
        infoTableView.register(ITCHTitleCell.self, forCellReuseIdentifier: ITCHTitleCell.reuseId)
        infoTableView.register(ITCHTeacherCell.self, forCellReuseIdentifier: ITCHTeacherCell.reuseId)
        infoTableView.register(ITCHNavigationRowCell.self, forCellReuseIdentifier: ITCHNavigationRowCell.reuseId)
        
        view.addSubview(infoTableView)
        infoTableView.pinTop(to: navigationBar.bottomAnchor)
        infoTableView.pinHorizontal(to: view)
        infoTableView.pinBottom(to: view)
    }
    
    // MARK: - Actions
    func changeCourseAction() -> UIAction {
        UIAction(title: "Изменить курс", image: ITCHImage.pen20.image) { [weak self] _ in
            self?.interactor.loadChengeCourse()
        }
    }
    
    func changeScheduleAction() -> UIAction {
        UIAction(title: "Изменить расписание", image: ITCHImage.calendar20.image) { [weak self] _ in
            self?.interactor.loadChangeSchedule()
        }
    }
    
    func deleteAction() -> UIAction {
        UIAction(
            title: "Удалить",
            image: ITCHImage.trash20.image,
            attributes: .destructive
        ) { [weak self] _ in
            self?.interactor.loadDismiss()
        }
    }
    
    var arr = ["Чат курса", "Оценки", "Участники", "Записи", "Домашние задания"]
}

extension ITCHCourseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 4 else { return }
        
        switch indexPath.row {
        case 0:
            interactor.loadChat()
        case 1:
            interactor.loadGrades()
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        section == 4 ? ITCHCourseHeaderView() : ITCHCourseHeaderView(with: interactor.titles[section])
    }
}
