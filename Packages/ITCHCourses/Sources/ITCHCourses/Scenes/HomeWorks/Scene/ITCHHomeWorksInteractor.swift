//
//  ITCHHomeWorksInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

final class ITCHHomeWorksInteractor: NSObject, ITCHHomeWorksBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic
    private let role: ITCHCourseUserRole
    
    // MARK: - Variables
    private var homeWorks: [ITCHHomeWorkModel] = [
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        ),
        ITCHHomeWorkModel(
            name: "Домашняя работа 1",
            date: Date(),
            linkForLoad: "https://github.com/IT-CH-app",
            linkForCheck: "https://github.com/IT-CH-app",
            linkOnTask: "https://github.com/IT-CH-app"
        )
    ]
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic,
        for role: ITCHCourseUserRole
    ) {
        self.presenter = presenter
        self.role = role
    }
    
    // MARK: - Methods    
    func loadAddHomeWork() {
        presenter.routeToAddHomeWork()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadStart() {
        presenter.presentStart(for: role, isEmpty: homeWorks.isEmpty)
    }
}

// MARK: - UITableViewDataSource
extension ITCHHomeWorksInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ITCHHomeWorkCell = tableView.dequeueCell(for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.configure(
            with: ITCHHomeWorkViewModel(
                title: homeWorks[indexPath.row].name,
                date: homeWorks[indexPath.row].date,
                role: role,
                openAction: { [weak self] in
                    self?.presenter.routeToOpen(with: self?.homeWorks[indexPath.row].linkOnTask)
                },
                solutionsAction: { [weak self] in
                    self?.presenter.routeToSolutions(with: self?.homeWorks[indexPath.row].linkForCheck)
                },
                editAction: { [weak self] in
                    self?.presenter.routeToEditHomeWork(with: self?.homeWorks[indexPath.row])
                }
            )
        )
        
        return cell
    }
}
