//
//  ITCHCourseProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHNetworking
import ITCHUtilities

protocol ITCHCourseBusinessLogic: UITableViewDataSource {
    var role: ITCHCourseUserRole { get }
    
    func loadStart()
    func loadDismiss()
    func loadChangeCourse()
    func loadChangeSchedule()
    func loadDeleteCourse()
    
    func loadChat()
    func loadGrades()
    func loadMembers()
    func loadRecords()
    func loadHomeWorks()
}

protocol ITCHCoursePresentationLogic {
    func presentStart(with role: ITCHCourseUserRole)
}

protocol ITCHCourseRouterLogic {
    func routeToChangeCourse(with model: ITCHCourseEditorModel?)
    func routeToChangeSchedule(with model: ITCHScheduleEditorModel?)
    func popViewController()
    
    func routeToChat(for link: String?)
    func routeToGrades(for link: String?)
    func routeToMembers(with id: Int)
    func routeToRecords(with role: ITCHCourseUserRole)
    func routeToHomeWorks(with role: ITCHCourseUserRole)
}

protocol ITCHCourseWorker {
    func fetchCourse(
        for token: String,
        with id: Int,
        completion: ((Result<ITCHCurrentCourseModel.Network.ITCHCourse?, Error>) -> Void)?
    )
    
    func deleteCourse(
        for token: String,
        with id: Int,
        completion: ((Result<String?, Error>) -> Void)?
    )
}
