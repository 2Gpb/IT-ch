//
//  ITCHCourseInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

final class ITCHCourseInteractor: ITCHCourseBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadChengeCourse() {
        presenter.routeToChangeCourse()
    }
    
    func loadChangeSchedule() {
        presenter.routeToChangeSchedule()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
