//
//  ITCHCoursePresenter.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

final class ITCHCoursePresenter: ITCHCoursePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHCourseViewController?
    
    // MARK: - Methods
    func presentStart() {
        view?.displayStart()
    }
}

// MARK: - RouterLogic
extension ITCHCoursePresenter: ITCHCourseRouterLogic {
    func routeToChangeCourse() {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(for: .edit), animated: true)
    }
    
    func routeToChangeSchedule() {
        view?.navigationController?.pushViewController(ITCHScheduleEditorAssembly.build(for: .edit), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToChat(for link: String?) {
        link?.openURL()
    }
    
    func routeToGrades(for link: String?) {
        link?.openURL()
    }
}
