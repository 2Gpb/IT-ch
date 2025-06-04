//
//  ITCHMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHCore
import ITCHUIComponents
import ITCHNetworking
import ITCHUtilities

final class ITCHMembersInteractor: NSObject, ITCHMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic
    private let networkService: ITCHMembersWorker
    private let secureService: ITCHSecureSessionLogic
    private var members: [ITCHMembersModel.Local.ITCHMember] = []
    private let id: Int
    
    // MARK: - Lifecycle
    init(
        with id: Int,
        presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic,
        networkService: ITCHMembersWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.id = id
        self.presenter = presenter
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        fetchMembers()
    }
    
    func loadAddMembers() {
        let actionOnDismiss: (() -> Void)?
        actionOnDismiss = { [weak self] in
            self?.loadStart()
        }
        presenter.routeToAddMembers(with: id, actionOnDismiss: actionOnDismiss)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    // MARK: - Private methods
    private func fetchMembers() {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.fetchMembers(
            for: tokensModel.token,
            with: id,
            completion: { [weak self] result in
                switch result {
                case .success(let members):
                    if let members {
                        self?.members = members.map { member in
                            ITCHMembersModel.Local.ITCHMember(
                                id: member.userId,
                                name: member.fullName,
                                role: ITCHCourseUserRole(rawValue: member.courseRole)?.text ?? ""
                            )
                        }
                        
                        DispatchQueue.main.async {
                            self?.presenter.presentStart()
                        }
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
    
    private func deleteMember(at userId: Int) {
        guard let tokensModel = secureService.get() else { return }
        networkService.deleteCourse(
            for: tokensModel.token,
            courseId: id,
            userId: userId,
            completion: { [weak self] result in
                switch result {
                case .success:
                    self?.fetchMembers()
                    
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
extension ITCHMembersInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHMemberCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHMemberCell else {
            return rawCell
        }
        
        cell.configure(
            with: ITCHAccountViewModel(
                image: nil,
                name: members[indexPath.row].name,
                info: members[indexPath.row].role
            ),
            changeRoleAction: { [weak self] in
                self?.presenter.presentChangeRoleAlert()
            },
            deleteAction: { [weak self] in
                self?.deleteMember(at: self?.members[indexPath.row].id ?? 0)
            }
        )
        
        return cell
    }
}
