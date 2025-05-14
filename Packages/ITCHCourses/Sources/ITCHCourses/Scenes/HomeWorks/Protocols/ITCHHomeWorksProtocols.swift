//
//  ITCHHomeWorksProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHHomeWorksBusinessLogic: UITableViewDataSource {
    func loadDismiss()
}

protocol ITCHHomeWorksPresentationLogic { }

protocol ITCHHomeWorksRouterLogic {
    func popViewController()
}
