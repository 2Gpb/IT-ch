//
//  ITCHRecordsInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities

final class ITCHRecordsInteractor: NSObject, ITCHRecordsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic
    private let id: Int
    private let role: ITCHCourseUserRole
    
    // MARK: - Variables
    private var records: [ITCHRecordModel] = []
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic,
        with id: Int,
        for role: ITCHCourseUserRole
    ) {
        self.presenter = presenter
        self.id = id
        self.role = role
    }
    
    // MARK: - Methods
    func loadAddRecord() {
        presenter.routeToAddRecord()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadStart() {
        presenter.presentStart(for: role, isEmpty: records.isEmpty)
    }
}

// MARK: - UITableViewDataSource
extension ITCHRecordsInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHRecordCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHRecordCell else {
            return rawCell
        }
        
        cell.configure(
            for: role,
            with: records[indexPath.row].date,
            openAction: { [weak self] in
                self?.presenter.routeToOpenRecord(with: self?.records[indexPath.row].link)
            },
            editAction: { [weak self] in
                self?.presenter.routeToEditRecord(with: self?.records[indexPath.row])
            }
        )
        
        return cell
    }
}
