//
//  ITCHMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

final class ITCHMembersInteractor: ITCHMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHMembersPresentationLogic & ITCHMembersRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
