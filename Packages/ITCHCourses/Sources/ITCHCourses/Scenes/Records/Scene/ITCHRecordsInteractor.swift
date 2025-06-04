//
//  ITCHRecordsInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities
import ITCHCore
import ITCHNetworking

final class ITCHRecordsInteractor: NSObject, ITCHRecordsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic
    private let id: Int
    private let role: ITCHCourseUserRole
    private let networkService: ITCHRecordWorker
    private let secureService: ITCHSecureSessionLogic
    
    // MARK: - Variables
    private var records: [ITCHRecordsModel.Local.ITCHRecord] = []
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic,
        with id: Int,
        for role: ITCHCourseUserRole,
        networkService: ITCHRecordWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.presenter = presenter
        self.id = id
        self.role = role
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadAddRecord() {
        presenter.routeToAddRecord(with: id, actionOnDismiss: loadRecords)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadStart() {
        presenter.presentStart(for: role)
        loadRecords()
    }
    
    // MARK: - Private methods
    private func loadRecords() {
        guard let tokenModels = secureService.get() else { return }
        
        networkService.fetchRecords(
            for: tokenModels.token,
            with: id,
            completion: { [weak self] result in
                switch result {
                case .success(let records):
                    self?.records = records?.map { record in
                        ITCHRecordsModel.Local.ITCHRecord(
                            id: record.id,
                            dateTitle: record.title,
                            videoLink: record.refToVideo
                        )
                    } ?? []
                    
                    DispatchQueue.main.async {
                        self?.presenter.presentRecords(isEmpty: self?.records.isEmpty ?? true)
                    }
                    
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        )
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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy'г.'"
        formatter.locale = Locale(identifier: "ru_RU")

        let date = formatter.date(from: records[indexPath.row].dateTitle)
        
        cell.configure(
            for: role,
            with: date ?? Date(),
            openAction: { [weak self] in
                self?.presenter.routeToOpenRecord(with: self?.records[indexPath.row].videoLink)
            },
            editAction: { [weak self] in
                self?.presenter.routeToEditRecord(
                    for: self?.id ?? 0,
                    with: self?.records[indexPath.row],
                    actionOnDismiss: self?.loadRecords
                )
            }
        )
        
        return cell
    }
}
