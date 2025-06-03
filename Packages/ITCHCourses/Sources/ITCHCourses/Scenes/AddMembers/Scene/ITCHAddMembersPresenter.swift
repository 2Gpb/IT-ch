//
//  ITCHAddMembersPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHAddMembersPresenter: ITCHAddMembersPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHAddMembersViewController?
    private let actionOnDismiss: (() -> Void)?
    
    init(actionOnDismiss: (() -> Void)?) {
        self.actionOnDismiss = actionOnDismiss
    }
    
    // MARK: - Methods
    func presentStart() {
        view?.displayStart()
    }
}

// MARK: - RouterLogic
extension ITCHAddMembersPresenter: ITCHAddMembersRouterLogic {
    func popViewController() {
        actionOnDismiss?()
        view?.dismiss(animated: true)
    }
}
