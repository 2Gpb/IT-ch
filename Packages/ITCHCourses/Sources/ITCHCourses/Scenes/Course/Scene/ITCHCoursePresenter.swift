//
//  ITCHCoursePresenter.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import ITCHUtilities

final class ITCHCoursePresenter: ITCHCoursePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHCourseViewController?
    
    // MARK: - Methods
    func presentStart(with role: ITCHCourseUserRole) {
        view?.displayStart(with: role)
    }
}

// MARK: - RouterLogic
extension ITCHCoursePresenter: ITCHCourseRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToChangeCourse(with model: ITCHCourseEditorModel?) {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(with: model), animated: true)
    }
    
    func routeToChangeSchedule(with model: ITCHScheduleEditorModel?) {
        view?.navigationController?.pushViewController(ITCHScheduleEditorAssembly.build(editWith: model), animated: true)
    }
    
    func routeToChat(for link: String?) {
        link?.openURL()
    }
    
    func routeToGrades(for link: String?) {
        link?.openURL()
    }
    
    func routeToMembers(with id: Int) {
        view?.navigationController?.pushViewController(ITCHMembersAssembly.build(with: id), animated: true)
    }
    
    func routeToRecords(with id: Int, for role: ITCHCourseUserRole) {
        view?.navigationController?.pushViewController(ITCHRecordsAssembly.build(with: id, for: role), animated: true)
    }
    
    func routeToHomeWorks(with id: Int, for role: ITCHCourseUserRole) {
        view?.navigationController?.pushViewController(ITCHHomeWorksAssembly.build(with: id, for: role), animated: true)
    }
}
