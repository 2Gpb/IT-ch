//
//  SignUpPasswordInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class SignUpPasswordInteractor: SignUpPasswordBusinessLogic {
    // MARK: - Private fields
    private let presenter: SignUpPasswordPresentationLogic & SignUpPasswordRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: SignUpPasswordPresentationLogic & SignUpPasswordRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
