//
//  ITCHMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHMembersInteractor: NSObject, ITCHMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic
    private let members: [ITCHMemberModel] = [
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadAddMembers() {
        presenter.routeToAddMembers()
    }
    
    func loadDismiss() {
        presenter.popViewController()
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
                image: members[indexPath.row].avatar,
                name: members[indexPath.row].name,
                info: members[indexPath.row].role
            ),
            changeRoleAction: { [weak self] in self?.presenter.presentChangeRoleAlert() },
            deleteAction: { print(1) }
        )
        
        return cell
    }
}
