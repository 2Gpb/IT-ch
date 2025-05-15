//
//  ITCHMyCoursesInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHCore
import ITCHUtilities

final class ITCHMyCoursesInteractor: NSObject, ITCHMyCoursesBusinessLogic, ITCHCoursesStorage {    
    // MARK: - Private fields
    private let presenter: ITCHMyCoursesPresentationLogic & ITCHMyCoursesRouterLogic
    
    // MARK: - Variables
    var courses: [ITCHCourseModel] = [
        ITCHCourseModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            teacherName: "Сосновский Григорий Михайлович",
            avatar: nil,
            duration: "1, 2, 3",
            location: "D106, Покровский б-р, д.11",
            role: "TEACHER",
            chatLink: "https://t.me/slyrack",
            gradesLink: "https://t.me/slyrack",
            dayOfWeek: "Вторник",
            numberOfHours: 1,
            time: "18:10",
            frequency: "1 раз в неделю"
        ),
        ITCHCourseModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            teacherName: "Сосновский Григорий Михайлович",
            avatar: nil,
            duration: "1, 2, 3",
            location: "D106, Покровский б-р, д.11",
            role: "STUDENT",
            chatLink: "https://t.me/slyrack",
            gradesLink: "https://t.me/slyrack",
            dayOfWeek: "Вторник",
            numberOfHours: 1,
            time: "18:10",
            frequency: "1 раз в неделю"
        ),
        ITCHCourseModel(
            courseName: "НИС “Основы iOS разработки на UIKit”",
            teacherName: "Сосновский Григорий Михайлович",
            avatar: nil,
            duration: "1, 2, 3",
            location: "D106, Покровский б-р, д.11",
            role: "ASSISTANT",
            chatLink: "https://t.me/slyrack",
            gradesLink: "https://t.me/slyrack",
            dayOfWeek: "Вторник",
            numberOfHours: 1,
            time: "18:10",
            frequency: "1 раз в неделю"
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
        presenter.roteToCourse(for: ITCHCourseUserRole(rawValue: courses[index].role) ?? .none, with: courses[index])
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
                duration: model.duration + " модули",
                role: ITCHCourseUserRole(rawValue: model.role)?.text ?? "",
                courseName: model.courseName,
                teacherName: model.teacherName,
                avatar: model.avatar
            )
        )
        
        return cell
    }
}
