//
//  ITCHRecordsProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities

protocol ITCHRecordsBusinessLogic: UITableViewDataSource {
    func loadAddRecord()
    func loadDismiss()
    func loadStart()
}

protocol ITCHRecordsPresentationLogic {
    func presentStart(for role: ITCHCourseUserRole, isEmpty: Bool)
}

protocol ITCHRecordsRouterLogic {
    func routeToAddRecord()
    func routeToOpenRecord(with link: String?)
    func routeToEditRecord(with model: ITCHRecordModel?)
    func popViewController()
}
