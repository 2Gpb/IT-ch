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
    private let role: ITCHCourseUserRole
    
    // MARK: - Variables
    private var records: [ITCHRecordModel] = [
        ITCHRecordModel(
            date: Date(),
            link: "https://habr.com/ru/articles/133559/"
        )
    ]
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic,
        for role: ITCHCourseUserRole
    ) {
        self.presenter = presenter
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
        let cell: ITCHRecordCell = tableView.dequeueCell(for: indexPath)
        
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
