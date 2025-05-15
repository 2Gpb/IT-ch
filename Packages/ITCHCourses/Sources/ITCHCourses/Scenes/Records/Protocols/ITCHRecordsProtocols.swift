//
//  ITCHRecordsProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHRecordsBusinessLogic: UITableViewDataSource {
    var records: [ITCHRecordModel] { get }
    
    func loadAddRecord()
    func loadDismiss()
    func loadStart()
}

protocol ITCHRecordsPresentationLogic {
    func presentStart()
}

protocol ITCHRecordsRouterLogic {
    func routeToAddRecord()
    func routeToEditRecord(with model: ITCHRecordModel?)
    func popViewController()
}
