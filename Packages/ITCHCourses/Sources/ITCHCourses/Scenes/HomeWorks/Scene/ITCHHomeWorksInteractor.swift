//
//  ITCHHomeWorksInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities
import ITCHCore
import ITCHNetworking

final class ITCHHomeWorksInteractor: NSObject, ITCHHomeWorksBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic
    private let id: Int
    private let role: ITCHCourseUserRole
    private let networkService: ITCHHomeWorksWorker
    private let secureService: ITCHSecureSessionLogic
    
    // MARK: - Variables
    private var homeWorks: [ITCHHomeWorksModel.Local.ITCHHomeWork] = []
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic,
        id: Int,
        for role: ITCHCourseUserRole,
        networkService: ITCHHomeWorksWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.presenter = presenter
        self.id = id
        self.role = role
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods    
    func loadAddHomeWork() {
        presenter.routeToAddHomeWork()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadStart() {
        presenter.presentStart(for: role)
    }
    
    func loadHomeWorks() {
        guard let tokenModels = secureService.get() else { return }
        
        switch role {
        case .teacher:
            fetchForTeacher(with: tokenModels.token)
        default:
            fetchForStudent(with: tokenModels.token)
        }
        
        presenter.presentHomeWorks(isEmpty: homeWorks.isEmpty)
    }
    
    // MARK: - Private methods
    private func fetchForStudent(with token: String) {
        networkService.fetchStudentHomeWorks(
            for: token,
            with: id,
            completion: { [weak self] result in
                switch result {
                case .success(let homeWorks):
                    guard let homeWorks else { return }
                    
                    self?.homeWorks = homeWorks.map { homeWork in
                        ITCHHomeWorksModel.Local.ITCHHomeWork(
                            id: homeWork.id,
                            title: homeWork.title,
                            date: homeWork.deadline,
                            linkOnTask: homeWork.refToHomework ?? "",
                            linkForLoad: homeWork.refToSubmitForm ?? ""
                        )
                    }
                    
                    DispatchQueue.main.async {
                        self?.presenter.presentHomeWorks(isEmpty: self?.homeWorks.isEmpty ?? true)
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
    
    private func fetchForTeacher(with token: String) {
        networkService.fetchTeacherHomeWorks(
            for: token,
            with: id,
            completion: { [weak self] result in
                switch result {
                case .success(let homeWorks):
                    guard let homeWorks else { return }
                    
                    self?.homeWorks = homeWorks.map { homeWork in
                        ITCHHomeWorksModel.Local.ITCHHomeWork(
                            id: homeWork.id,
                            title: homeWork.title,
                            date: homeWork.deadline,
                            linkOnTask: homeWork.refToHomework ?? "",
                            linkForCheck: homeWork.refToSolutionView ?? ""
                        )
                    }
                    
                    DispatchQueue.main.async {
                        self?.presenter.presentHomeWorks(isEmpty: self?.homeWorks.isEmpty ?? true)
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
extension ITCHHomeWorksInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHHomeWorkCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHHomeWorkCell else {
            return rawCell
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_RU")

        let date = formatter.date(from: homeWorks[indexPath.row].date)
        
        cell.configure(
            with: ITCHHomeWorkViewModel(
                title: homeWorks[indexPath.row].title,
                date: date ?? Date(),
                role: role,
                openAction: { [weak self] in
                    self?.presenter.routeToOpen(with: self?.homeWorks[indexPath.row].linkOnTask)
                },
                solutionsAction: { [weak self] in
                    self?.presenter.routeToSolutions(with: self?.homeWorks[indexPath.row].linkForCheck)
                },
                editAction: { // [weak self] in
//                    self?.presenter.routeToEditHomeWork(with: self?.homeWorks[indexPath.row])
                }
            )
        )
        
        return cell
    }
}
