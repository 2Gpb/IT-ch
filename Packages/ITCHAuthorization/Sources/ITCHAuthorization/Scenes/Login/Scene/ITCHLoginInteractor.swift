//
//  ITCHLoginInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

final class ITCHLoginInteractor: ITCHLoginBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
