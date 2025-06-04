//
//  ITCHMyCoursesProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUtilities

protocol ITCHMyCoursesBusinessLogic: UITableViewDataSource {
    var courses: [ITCHCoursesModel.Local.ITCHCourse] { get }
    
    func loadStart()
    func loadCourse(for index: Int)
    func loadCreateCourse()
    func loadCourses()
}

protocol ITCHMyCoursesPresentationLogic {
    func presentStart(with role: ITCHUserRole?)
    func presentCourses(isEmpty: Bool)
}

protocol ITCHMyCoursesRouterLogic {
    func routeToCourse(with id: Int)
    func routeToCreateCourse()
}

protocol ITCHMyCoursesWorker {
    func fetchCourses(
        for token: String,
        completion: ((Result<[ITCHCoursesModel.Network.ITCHCourse]?, Error>) -> Void)?
    )
}
