//
//  ITCHMyCoursesProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUtilities

protocol ITCHMyCoursesBusinessLogic: UITableViewDataSource {
    func loadStart()
    func loadCourse()
    func loadCreateCourse()
}

protocol ITCHMyCoursesPresentationLogic {
    func presentStart(with role: ITCHUserRole?)
}

protocol ITCHMyCoursesRouterLogic {
    func roteToCourse()
    func routeToCreateCourse()
}

protocol ITCHCoursesStorage {
    var courses: [ITCHCourseModel] { get set }
}
