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
    func loadStart()
}

protocol ITCHRecordsPresentationLogic {
    func presentStart(isEmpty: Bool)
}

protocol ITCHRecordsRouterLogic {
    func routeToAddRecord()
    func routeToEditRecord(with model: ITCHRecordModel?)
    func popViewController()
}
