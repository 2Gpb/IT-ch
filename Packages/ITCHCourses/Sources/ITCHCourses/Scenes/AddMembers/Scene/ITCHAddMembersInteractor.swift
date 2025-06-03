//
//  ITCHAddMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHCore
import ITCHUtilities
import ITCHNetworking

final class ITCHAddMembersInteractor: NSObject, ITCHAddMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic
    private let id: Int
    private let networkService: ITCHAddMembersWorker
    private let secureService: ITCHSecureSessionLogic
    private var members: [ITCHAddMembersModel.Local.ITCHMember] = []
    private var selectedMembersId: [Int] = []
    
    // MARK: - Lifecycle
    init(
        with id: Int,
        presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic,
        networkService: ITCHAddMembersWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.presenter = presenter
        self.id = id
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.fetchAllMembers(
            for: tokensModel.token,
            completion: { [weak self] result in
                switch result {
                case .success(let members):
                    if let members {
                        self?.members = members.map { member in
                            ITCHAddMembersModel.Local.ITCHMember(
                                id: member.id,
                                name: member.fullName,
                                role: ITCHCourseUserRole(rawValue: member.role)?.text ?? ""
                            )
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self?.presenter.presentStart()
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
    
    func selectedMember(at row: Int) {
        selectedMembersId.append(members[row].id)
    }
    
    func loadAddMembers() {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.sendSelectedMembers(
            for: tokensModel.token,
            with: id,
            selectedMembersIds: ITCHAddMembersModel.Network.ITCHAddedMembers(userIds: selectedMembersId),
            completion: { [weak self] result in
                switch result {
                case .success:
                    self?.selectedMembersId.removeAll()
                    
                    DispatchQueue.main.async {
                        self?.presenter.popViewController()
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
    
    func loadDismiss() {
        presenter.popViewController()
    }
}

// MARK: - UITableViewDataSource
extension ITCHAddMembersInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHMemberToAddCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHMemberToAddCell else {
            return rawCell
        }
        
        cell.configure(
            with: ITCHAccountViewModel(
                image: nil,
                name: members[indexPath.row].name,
                info: members[indexPath.row].role
            )
        )
        
        return cell
    }
}
