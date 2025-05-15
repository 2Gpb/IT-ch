//
//  ITCHHomeWorksProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHHomeWorksBusinessLogic: UITableViewDataSource {
    var homeWorks: [ITCHHomeWorkModel] { get }
    
    func loadAddHomeWork()
    func loadDismiss()
    func loadStart()
}

protocol ITCHHomeWorksPresentationLogic {
    func presentStart()
}

protocol ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork()
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?)
    func popViewController()
}
