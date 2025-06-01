//
//  ITCHMyCoursesPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import ITCHUtilities

final class ITCHMyCoursesPresenter: ITCHMyCoursesPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHMyCoursesViewController?
    
    // MARK: - Methods
    func presentStart(with role: ITCHUserRole?) {
        view?.displayStart(with: role)
    }
    
    func presentCourses(isEmpty: Bool) {
        view?.displayCourses(isEmpty: isEmpty)
    }
}

// MARK: - RouterLogic
extension ITCHMyCoursesPresenter: ITCHMyCoursesRouterLogic {
    func roteToCourse(with model: ITCHCoursesModel.Local.ITCHCourse) {
//        let range = Array(model.startModule...model.endModule)
//        
//        view?.navigationController?.pushViewController(
//            ITCHCourseAssembly.build(
//                with: ITCHCurrentCourseModel(
//                    courseName: model.courseName,
//                    teacherName: model.teacherName,
//                    avatar: model.avatar,
//                    durationLocation: [range.joinedString(), model.location],
//                    role: model.role,
//                    chatLink: model.chatLink,
//                    gradesLink: model.gradesLink,
//                    dayOfWeek: model.dayOfWeek,
//                    numberOfHours: model.numberOfHours,
//                    time: model.time,
//                    frequency: model.frequency
//                )
//            ),
//            animated: true
//        )
    }
    
    func routeToCreateCourse() {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(), animated: true)
    }
}
