//
//  ITCHCourseInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit

final class ITCHCourseInteractor: NSObject, ITCHCourseBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic
    private let actionRowTitles = ["Чат курса", "Оценки", "Участники", "Записи", "Домашние задания"]
    private let course: ITCHCurrentCourseModel = ITCHCurrentCourseModel(
        courseName: "НИС “Основы iOS разработки на UIKit”",
        teacherName: "Сосновский Григорий Михайлович",
        avatar: nil,
        generalInfo: ["•  1, 2, 3 модули", "•  D106, Покровский б-р, д.11"],
        role: "Преподаватель",
        chatLink: "https://t.me/slyrack",
        gradesLink: "https://t.me/slyrack"
    )
    
    // MARK: - Lifecycle
    init(presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart()
    }
    
    func loadChengeCourse() {
        presenter.routeToChangeCourse()
    }
    
    func loadChangeSchedule() {
        presenter.routeToChangeSchedule()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadChat() {
        presenter.routeToChat(for: course.chatLink)
    }
    
    func loadGrades() {
        presenter.routeToGrades(for: course.gradesLink)
    }
}

// MARK: - UITableViewDataSource
extension ITCHCourseInteractor: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        ITCHCurrentCourseSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ITCHCurrentCourseSection(
            rawValue: section
        ) else {
            return 0
        }
        
        switch section {
        case .info:
            return course.generalInfo.count
        case .actions:
            return actionRowTitles.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ITCHCurrentCourseSection(
            rawValue: indexPath.section
        ) else {
            return UITableViewCell()
        }
        
        switch section {
        case .course:
            let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: course.courseName)
            return cell
            
        case .teacher:
            let cell: ITCHTeacherCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: course.teacherName, image: course.avatar)
            return cell
            
        case .info:
            let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: course.generalInfo[indexPath.row])
            return cell
            
        case .role:
            let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: course.role)
            return cell
            
        case .actions:
            let cell: ITCHNavigationRowCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: actionRowTitles[indexPath.row])
            return cell
        }
    }
}
