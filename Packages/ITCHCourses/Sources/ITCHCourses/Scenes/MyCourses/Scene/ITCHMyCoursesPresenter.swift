//
//  ITCHMyCoursesPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

final class ITCHMyCoursesPresenter: ITCHMyCoursesPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHMyCoursesViewController?
    
    // MARK: - Methods
    func presentStart() {
        view?.displayStart()
    }
}

// MARK: - RouterLogic
extension ITCHMyCoursesPresenter: ITCHMyCoursesRouterLogic { }
