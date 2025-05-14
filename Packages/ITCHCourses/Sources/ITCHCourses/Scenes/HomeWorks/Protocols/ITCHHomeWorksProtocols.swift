//
//  ITCHHomeWorksProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHHomeWorksBusinessLogic: UITableViewDataSource {
    func loadAddHomeWork()
    func loadDismiss()
}

protocol ITCHHomeWorksPresentationLogic { }

protocol ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork()
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?)
    func popViewController()
}
