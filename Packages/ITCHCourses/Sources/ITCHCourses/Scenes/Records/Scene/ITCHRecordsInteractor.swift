//
//  ITCHRecordsInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHRecordsInteractor: NSObject, ITCHRecordsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic
    private let records: [ITCHRecordModel] = [
        ITCHRecordModel(
            date: Date(),
            link: "https://habr.com/ru/articles/133559/"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
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
            for: records[indexPath.row].date,
            openAction: { [weak self] in self?.records[indexPath.row].link.openURL() },
            editAction: { }
        )
        
        return cell
    }
}
