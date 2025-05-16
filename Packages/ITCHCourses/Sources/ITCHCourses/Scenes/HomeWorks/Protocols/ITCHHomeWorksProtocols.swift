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
    func presentStart(for role: ITCHCourseUserRole, isEmpty: Bool)
}

protocol ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork()
    func routeToOpen(with link: String?)
    func routeToSolutions(with link: String?)
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?)
    func popViewController()
}
