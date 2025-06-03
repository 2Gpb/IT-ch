//
//  ITCHHomeWorksProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities

protocol ITCHHomeWorksBusinessLogic: UITableViewDataSource {
    func loadAddHomeWork()
    func loadDismiss()
    func loadStart()
    func loadHomeWorks()
}

protocol ITCHHomeWorksPresentationLogic {
    func presentStart(for role: ITCHCourseUserRole)
    func presentHomeWorks(isEmpty: Bool)
}

protocol ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork()
    func routeToOpen(with link: String?)
    func routeToSolutions(with link: String?)
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?)
    func popViewController()
}

protocol ITCHHomeWorksWorker {
    func fetchStudentHomeWorks(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHHomeWorksModel.Network.ITCHHomeWorkStudent]?, Error>) -> Void)?
    )
    
    func fetchTeacherHomeWorks(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHHomeWorksModel.Network.ITCHHomeWorkTeacher]?, Error>) -> Void)?
    )
}
