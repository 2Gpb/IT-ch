//
//  ITCHCourseProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

protocol ITCHCourseBusinessLogic {
    func loadDismiss()
    func loadChengeCourse()
    func loadChangeSchedule()
}

protocol ITCHCoursePresentationLogic { }

protocol ITCHCourseRouterLogic {
    func routeToChangeCourse()
    func routeToChangeSchedule()
    func popViewController()
}
