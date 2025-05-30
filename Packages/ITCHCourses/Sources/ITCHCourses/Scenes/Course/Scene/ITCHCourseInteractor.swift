//
//  ITCHCourseInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUtilities

final class ITCHCourseInteractor: NSObject, ITCHCourseBusinessLogic, ITCHCourseRoleStorage {
    // MARK: - Private fields
    private let presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic
    private let actionRowTitles: [String]
    private let course: ITCHCurrentCourseModel
    private let titles = ["КУРС", "ПРЕПОДАВАТЕЛЬ", "ОБЩАЯ ИНФОРМАЦИЯ", "ВАША РОЛЬ"]
    
    // MARK: - Variables
    var role: ITCHCourseUserRole
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic,
        with model: ITCHCurrentCourseModel
    ) {
        self.presenter = presenter
        self.role = ITCHCourseUserRole(rawValue: model.role) ?? .none
        self.course = model
        actionRowTitles = ITCHCurrentCourseAction.titleActions(for: self.role)
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart()
    }
    
    func loadChangeCourse() {
        let durationRange = course.durationLocation[0].toIntArray()
        
        presenter.routeToChangeCourse(
            with: ITCHCourseEditorModel(
                name: course.courseName,
                location: course.durationLocation[1],
                startModule: durationRange.first ?? 1,
                endModule: durationRange.last ?? 1,
                chatLink: course.chatLink,
                gradesLink: course.gradesLink
            )
        )
    }
    
    func loadChangeSchedule() {
        presenter.routeToChangeSchedule(
            with: ITCHScheduleEditorModel(
                dayOfWeek: course.dayOfWeek,
                numberOfHours: course.numberOfHours,
                time: course.time,
                frequency: course.frequency
            )
        )
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
    
    func loadMembers() {
        presenter.routeToMembers()
    }
    
    func loadRecords() {
        presenter.routeToRecords(with: role)
    }
    
    func loadHomeWorks() {
        presenter.routeToHomeWorks(with: role)
    }
}

// MARK: - UITableViewDataSource
extension ITCHCourseInteractor: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        ITCHCurrentCourseSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ITCHCurrentCourseSection(rawValue: section) else { return 0 }
        
        /// with header
        switch section {
        case .info:
            return course.durationLocation.count + 1
        case .actions:
            return actionRowTitles.count + 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section ) else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            return headerCell(tableView, indexPath)
        }
        
        switch section {
        case .course:
            return courseCell(tableView, indexPath)
        case .teacher:
            return teacherCell(tableView, indexPath)
        case .info:
            return infoCell(tableView, indexPath)
        case .role:
            return roleCell(tableView, indexPath)
        case .actions:
            return actionCell(tableView, indexPath)
        }
    }
}

// MARK: - Configure cells
extension ITCHCourseInteractor {
    private func headerCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHCourseHeaderCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        cell.configure(with: section.title)
        return cell
    }
    
    private func courseCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(with: course.courseName)
        return cell
    }

    private func teacherCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHTeacherCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(with: course.teacherName, image: course.avatar)
        return cell
    }

    private func infoCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        let actualIndex = indexPath.row - 1
        let suffix = actualIndex == 0 ? " модули" : ""
        let text = "•  \(course.durationLocation[actualIndex])\(suffix)"
        cell.configure(with: text)
        return cell
    }

    private func roleCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        let roleText = ITCHCourseUserRole(rawValue: course.role)?.text ?? ""
        cell.configure(with: roleText)
        return cell
    }

    private func actionCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHNavigationRowCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        let actualIndex = indexPath.row - 1
        cell.configure(with: actionRowTitles[actualIndex])
        return cell
    }
}
