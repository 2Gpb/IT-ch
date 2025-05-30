//
//  ITCHSignUpInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import Foundation

final class ITCHSignUpInteractor: ITCHSignUpBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSignUpPresentationLogic & ITCHSignUpRouterLogic
    private let service: ITCHSignUpWorker
    private let userFullName: String
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHSignUpPresentationLogic & ITCHSignUpRouterLogic,
        service: ITCHSignUpWorker,
        fullName: String
    ) {
        self.presenter = presenter
        self.service = service
        self.userFullName = fullName
    }
    
    // MARK: - Methods
    func loadInfo() {
        presenter.routeToInfo()
    }
    
    func loadCode(with email: String) {
        service.sendUserInfo(
            with: ITCHSignUp.Network.ITCHDTOFullName(email: email, fullName: userFullName)) { [weak self] response in
            switch response {
            case .success(let respone):
                if let respone {
                    print("error status: \(respone.status)")
                    print("error: \(respone.error)")
                    print("error message: \(respone.message)")
                } else {
                    DispatchQueue.main.async {
                        self?.presenter.routeToCode(with: email)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
