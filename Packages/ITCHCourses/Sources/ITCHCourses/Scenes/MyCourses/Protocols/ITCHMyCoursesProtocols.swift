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
    func loadCourse(for index: Int)
    func loadCreateCourse()
}

protocol ITCHMyCoursesPresentationLogic {
    func presentStart(with role: ITCHUserRole?, isEmpty: Bool)
}

protocol ITCHMyCoursesRouterLogic {
    func roteToCourse(with model: ITCHCourseModel)
    func routeToCreateCourse()
}
