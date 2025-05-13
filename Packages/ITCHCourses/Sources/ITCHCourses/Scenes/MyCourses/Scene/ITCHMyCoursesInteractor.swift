//
//  ITCHMyCoursesInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHCore

final class ITCHMyCoursesInteractor: NSObject, ITCHMyCoursesBusinessLogic, ITCHCoursesStorage {
    // MARK: - Private fields
    private let presenter: ITCHMyCoursesPresentationLogic & ITCHMyCoursesRouterLogic
    
    // MARK: - Variables
    var courses: [ITCHCourseModel] = [
        ITCHCourseModel(
            duration: "1 - 3 модуль",
            role: "Преподаватель",
            courseName: "НИС “Основы iOS разработки на UIKit”",
            teacherName: "Сосновский Григорий Михайлович",
            avatar: nil
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHMyCoursesPresentationLogic & ITCHMyCoursesRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: ITCHUserRoleService().role)
    }
    
    func loadCourse(for index: Int) {
        presenter.roteToCourse(with: courses[index])
    }
    
    func loadCreateCourse() {
        presenter.routeToCreateCourse()
    }
}

// MARK: - UITableViewDataSource
extension ITCHMyCoursesInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHCourseCell.reuseId
        ) as? ITCHCourseCell else {
            return UITableViewCell()
        }
        
        let model = courses[indexPath.row]
        cell.configure(
            with: ITCHCourseViewModel(
                duration: model.duration,
                role: model.role,
                courseName: model.courseName,
                teacherName: model.teacherName,
                avatar: model.avatar
            )
        )
        
        return cell
    }
}
