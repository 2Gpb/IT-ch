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
    func presentStart(for role: ITCHCourseUserRole)
    func presentRecords(isEmpty: Bool)
}

protocol ITCHRecordsRouterLogic {
    func routeToAddRecord(with id: Int, actionOnDismiss: (() -> Void)?)
    func routeToOpenRecord(with link: String?)
    func routeToEditRecord(for id: Int, with model: ITCHRecordModel?, actionOnDismiss: (() -> Void)?)
    func popViewController()
}

protocol ITCHRecordWorker {
    func fetchRecords(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHRecordsModel.Network.ITCHRecord]?, Error>) -> Void)?
    ) 
}
