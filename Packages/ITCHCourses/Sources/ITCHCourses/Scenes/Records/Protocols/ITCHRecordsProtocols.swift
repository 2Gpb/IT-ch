//
//  ITCHRecordsProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHRecordsBusinessLogic: UITableViewDataSource {
    func loadAddRecord()
    func loadDismiss()
}

protocol ITCHRecordsPresentationLogic { }

protocol ITCHRecordsRouterLogic {
    func routeToAddRecord()
    func routeToEditRecord()
    func popViewController()
}
