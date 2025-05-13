//
//  ITCHMembersPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

final class ITCHMembersPresenter: ITCHMembersPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHMembersViewController?
}

// MARK: - RouterLogic
extension ITCHMembersPresenter: ITCHMembersRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
