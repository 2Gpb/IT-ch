//
//  ITCHMembersPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

final class ITCHMembersPresenter: ITCHMembersPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHMembersViewController?
    
    // MARK: - Methods
    func presentStart() {
        view?.displayStart()
    }
    
    func presentChangeRoleAlert() {
        view?.displayRoleChangeAlert()
    }
}

// MARK: - RouterLogic
extension ITCHMembersPresenter: ITCHMembersRouterLogic {
    func routeToAddMembers() {
        view?.present(ITCHAddMembersAssembly.build(), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
