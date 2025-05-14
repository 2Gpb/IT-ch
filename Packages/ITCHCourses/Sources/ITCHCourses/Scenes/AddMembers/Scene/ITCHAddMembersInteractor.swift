//
//  ITCHAddMembersInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHAddMembersInteractor: ITCHAddMembersBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHAddMembersPresentationLogic & ITCHAddMembersRouterLogic) {
        self.presenter = presenter
    }
}
