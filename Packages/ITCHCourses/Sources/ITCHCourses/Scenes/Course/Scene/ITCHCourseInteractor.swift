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
    var actionRowTitles = ["Чат курса", "Оценки", "Участники", "Записи", "Домашние задания"]
    var titles = ["КУРС", "ПРЕПОДАВАТЕЛЬ", "ОБЩАЯ ИНФОРМАЦИЯ", "ВАША РОЛЬ"]
    private let course: ITCHCurrentCourseModel
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic,
        model: ITCHCourseModel
    ) {
        self.presenter = presenter
        self.course = ITCHCurrentCourseModel(
            courseName: model.courseName,
            teacherName: model.teacherName,
            avatar: model.avatar,
            generalInfo: [model.duration, model.location],
            role: model.role,
            chatLink: model.chatLink,
            gradesLink: model.gradesLink
        )
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
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 3:
            return 1
        case 2:
            return 2
        case 4:
            return actionRowTitles.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = dequeueCell(ofType: ITCHTitleCell.self, for: tableView, at: indexPath)
            cell.configure(with: course.courseName)
            return cell
            
        case 1:
            let cell = dequeueCell(ofType: ITCHTeacherCell.self, for: tableView, at: indexPath)
            cell.configure(with: course.teacherName, image: course.avatar)
            return cell
            
        case 2:
            let cell = dequeueCell(ofType: ITCHTitleCell.self, for: tableView, at: indexPath)
            cell.configure(with: course.generalInfo[indexPath.row])
            return cell
            
        case 3:
            let cell = dequeueCell(ofType: ITCHTitleCell.self, for: tableView, at: indexPath)
            cell.configure(with: course.role)
            return cell
            
        case 4:
            let cell = dequeueCell(ofType: ITCHNavigationRowCell.self, for: tableView, at: indexPath)
            cell.configure(with: actionRowTitles[indexPath.row])
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func dequeueCell<T: UITableViewCell>(
        ofType type: T.Type,
        for tableView: UITableView,
        at indexPath: IndexPath
    ) -> T {
        return tableView.dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as! T
    }
}
