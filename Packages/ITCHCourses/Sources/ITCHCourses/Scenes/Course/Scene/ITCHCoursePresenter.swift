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
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToChangeCourse(with model: ITCHCourseEditorModel?) {
        view?.navigationController?.pushViewController(ITCHCourseEditorAssembly.build(with: model), animated: true)
    }
    
    func routeToChangeSchedule(with model: ITCHScheduleEditorModel?) {
        view?.navigationController?.pushViewController(ITCHScheduleEditorAssembly.build(with: model), animated: true)
    }
    
    func routeToChat(for link: String?) {
        link?.openURL()
    }
    
    func routeToGrades(for link: String?) {
        link?.openURL()
    }
    
    func routeToMembers() {
        view?.navigationController?.pushViewController(ITCHMembersAssembly.build(), animated: true)
    }
    
    func routeToRecords() {
        view?.navigationController?.pushViewController(ITCHRecordsAssembly.build(), animated: true)
    }
    
    func routeToHomeWorks() {
        view?.navigationController?.pushViewController(ITCHHomeWorksAssembly.build(), animated: true)
    }
}
