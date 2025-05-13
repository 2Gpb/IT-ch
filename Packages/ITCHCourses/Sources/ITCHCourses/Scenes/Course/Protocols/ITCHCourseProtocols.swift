//
//  ITCHCourseProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit

protocol ITCHCourseBusinessLogic: UITableViewDataSource {
    var titles: [String] { get }
    
    func loadStart()
    func loadDismiss()
    func loadChengeCourse()
    func loadChangeSchedule()
    
    func loadChat()
    func loadGrades()
}

protocol ITCHCoursePresentationLogic {
    func presentStart()
}

protocol ITCHCourseRouterLogic {
    func routeToChangeCourse()
    func routeToChangeSchedule()
    func popViewController()
    
    func routeToChat(for link: String?)
    func routeToGrades(for link: String?)
}
