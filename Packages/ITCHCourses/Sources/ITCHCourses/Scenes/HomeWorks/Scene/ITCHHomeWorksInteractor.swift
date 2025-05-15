//
//  ITCHHomeWorksInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHHomeWorksInteractor: NSObject, ITCHHomeWorksBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic
    
    // MARK: - Variables
    private var homeWorks: [ITCHHomeWorkModel] = [
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods    
    func loadAddHomeWork() {
        presenter.routeToAddHomeWork()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadStart() {
        presenter.presentStart(isEmpty: homeWorks.isEmpty)
    }
}

// MARK: - UITableViewDataSource
extension ITCHHomeWorksInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ITCHHomeWorkCell = tableView.dequeueCell(for: indexPath)
        
        cell.configure(
            with: homeWorks[indexPath.row].name,
            date: homeWorks[indexPath.row].date,
            openAction: { [weak self] in self?.homeWorks[indexPath.row].linkOnTask.openURL() },
            editAction: { [weak self] in self?.presenter.routeToEditHomeWork(with: self?.homeWorks[indexPath.row]) }
        )
        
        return cell
    }
}
