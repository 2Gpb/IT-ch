//
//  ITCHLoginInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import Foundation
import ITCHNetworking

final class ITCHLoginInteractor: ITCHLoginBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic
    private let service: ITCHLoginWorker
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic,
        service: ITCHLoginWorker
    ) {
        self.presenter = presenter
        self.service = service
    }
    
    // MARK: - Methods
    func loadCourses(email: String, password: String) {
        service.sendPassword(
            with: ITCHLoginModel.Network.ITCHDTOLogin(
                email: email,
                password: password
            ), completion: { [weak self] result in
                switch result {
                case .success(let tokens):
                    print(tokens?.token ?? "")
                    
                    DispatchQueue.main.async {
                        self?.presenter.routeToCourses()
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    }
                    
                    DispatchQueue.main.async {
                        self?.presenter.presentError()
                    }
                }
            }
        )
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadPasswordRecovery() {
        presenter.routeToPasswordRecovery()
    }
}
