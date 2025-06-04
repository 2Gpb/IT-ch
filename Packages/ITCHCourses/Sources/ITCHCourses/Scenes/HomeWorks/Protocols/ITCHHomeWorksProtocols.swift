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
}

protocol ITCHHomeWorksPresentationLogic {
    func presentStart(for role: ITCHCourseUserRole)
    func presentHomeWorks(isEmpty: Bool)
}

protocol ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork(with id: Int, actionOnDismiss: (() -> Void)?)
    func routeToOpen(with link: String?)
    func routeToSolutions(with link: String?)
    func routeToEditHomeWork(
        for id: Int,
        with model: ITCHHomeWorksModel.Local.ITCHHomeWork?,
        actionOnDismiss: (() -> Void)?
    )
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
