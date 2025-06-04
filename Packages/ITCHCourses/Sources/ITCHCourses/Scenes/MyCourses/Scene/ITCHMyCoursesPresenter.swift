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
    func routeToCourse(with id: Int) {
        view?.navigationController?.pushViewController(
            ITCHCourseAssembly.build(with: id), animated: true
        )
    }
    
    func routeToCreateCourse() {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(), animated: true)
    }
}
