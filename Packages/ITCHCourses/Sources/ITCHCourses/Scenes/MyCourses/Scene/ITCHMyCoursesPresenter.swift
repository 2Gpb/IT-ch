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
}

// MARK: - RouterLogic
extension ITCHMyCoursesPresenter: ITCHMyCoursesRouterLogic {
    func roteToCourse(with model: ITCHCourseModel) {
        view?.navigationController?.pushViewController(ITCHCourseAssembly.build(), animated: true)
    }
    
    func routeToCreateCourse() {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(for: .create), animated: true)
    }
}
