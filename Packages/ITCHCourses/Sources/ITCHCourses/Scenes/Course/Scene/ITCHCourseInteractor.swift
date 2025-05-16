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
        presenter.routeToChangeCourse(
            with: ITCHCourseEditorModel(
                name: course.courseName,
                location: course.locationDuration[1],
                duration: course.locationDuration[0],
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
        
        switch section {
        case .info:
            return course.locationDuration.count
        case .actions:
            return actionRowTitles.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section ) else {
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
            cell.configure(with: "•  " + course.locationDuration[indexPath.row] + (indexPath.row == 0 ? " модули" : ""))
            return cell
            
        case .role:
            let cell: ITCHTitleCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: ITCHCourseUserRole(rawValue: course.role)?.text ?? "")
            return cell
            
        case .actions:
            let cell: ITCHNavigationRowCell = tableView.dequeueCell(for: indexPath)
            cell.configure(with: actionRowTitles[indexPath.row])
            return cell
        }
    }
}
