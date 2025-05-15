//
//  ITCHCourseProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUtilities

protocol ITCHCourseBusinessLogic: UITableViewDataSource {
    func loadStart()
    func loadDismiss()
    func loadChangeCourse()
    func loadChangeSchedule()
    
    func loadChat()
    func loadGrades()
    func loadMembers()
    func loadRecords()
    func loadHomeWorks()
}

protocol ITCHCoursePresentationLogic {
    func presentStart()
}

protocol ITCHCourseRouterLogic {
    func routeToChangeCourse(with model: ITCHCourseEditorModel?)
    func routeToChangeSchedule(with model: ITCHScheduleEditorModel?)
    func popViewController()
    
    func routeToChat(for link: String?)
    func routeToGrades(for link: String?)
    func routeToMembers()
    func routeToRecords()
    func routeToHomeWorks()
}

protocol ITCHCourseRoleStorage {
    var role: ITCHCourseUserRole { get }
}
