//
//  ITCHSignUpPasswordInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHSignUpPasswordInteractor: ITCHSignUpPasswordBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadEnterFullName() {
        presenter.routeToEnterFullName()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
