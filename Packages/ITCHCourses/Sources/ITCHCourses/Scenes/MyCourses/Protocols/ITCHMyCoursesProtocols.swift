//
//  ITCHMyCoursesProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit

protocol ITCHMyCoursesBusinessLogic: UITableViewDataSource {
    func loadStart()
}

protocol ITCHMyCoursesPresentationLogic {
    func presentStart()
}

protocol ITCHMyCoursesRouterLogic { }

protocol ITCHCoursesStorage {
    var courses: [ITCHCourseModel] { get set }
}
