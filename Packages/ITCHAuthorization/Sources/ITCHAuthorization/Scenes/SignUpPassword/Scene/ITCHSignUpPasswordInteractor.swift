//
//  ITCHSignUpPasswordInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import Foundation

final class ITCHSignUpPasswordInteractor: ITCHSignUpPasswordBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic
    private let service: ITCHSignUpPasswordWorker
    private let email: String
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic,
        service: ITCHSignUpPasswordWorker,
        email: String
    ) {
        self.presenter = presenter
        self.service = service
        self.email = email
    }
    
    // MARK: - Methods
    func loadCourses(with password: String) {
        service.sendPassword(with: ITCHSignUpPassword.Network.ITCHDTOPassword(
            email: email,
            password: password
        ), completion: { [weak self] result in
            switch result {
            case .success(let tokens):
                print(tokens?.token)
                print(tokens?.refreshToken)
                
                DispatchQueue.main.async {
                    self?.presenter.routeToCourses()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
