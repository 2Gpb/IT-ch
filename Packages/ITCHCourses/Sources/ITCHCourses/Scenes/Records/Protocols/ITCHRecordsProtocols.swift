//
//  ITCHRecordsProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHRecordsBusinessLogic: UITableViewDataSource {
    func loadDismiss()
}

protocol ITCHRecordsPresentationLogic { }

protocol ITCHRecordsRouterLogic {
    func popViewController()
}
