//
//  ITCHFullNameInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHFullNameInteractor: ITCHFullNameBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHFullNamePresentationLogic & ITCHFullNameRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHFullNamePresentationLogic & ITCHFullNameRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadSignUp(with fullName: String) {
        presenter.routeToSignUp(with: fullName)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
