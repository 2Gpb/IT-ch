//
//  ITCHAddMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHAddMembersInteractor: NSObject, ITCHAddMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic
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
        ),
        ITCHMemberModel(
            name: "Тюхменев Петр Вячеславович",
            avatar: nil,
            role: "Студент"
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
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
                image: members[indexPath.row].avatar,
                name: members[indexPath.row].name,
                info: members[indexPath.row].role
            )
        )
        
        return cell
    }
}
