//
//  ITCHSignUpInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHSignUpInteractor: ITCHSignUpBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSignUpPresentationLogic & ITCHSignUpRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHSignUpPresentationLogic & ITCHSignUpRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadInfo() {
        presenter.routeToInfo()
    }
    
    func loadCode() {
        presenter.routeToCode()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
