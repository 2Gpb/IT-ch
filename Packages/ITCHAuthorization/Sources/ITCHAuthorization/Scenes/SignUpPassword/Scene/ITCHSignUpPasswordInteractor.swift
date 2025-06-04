//
//  ITCHSignUpPasswordInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import Foundation
import ITCHCore
import ITCHUtilities

final class ITCHSignUpPasswordInteractor: ITCHSignUpPasswordBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic
    private let networkService: ITCHSignUpPasswordWorker
    private let userRoleService: ITCHUserRoleLogic
    private let secureSessionService: ITCHSecureSessionLogic
    private let email: String
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHSignUpPasswordPresentationLogic & ITCHSignUpPasswordRouterLogic,
        networkService: ITCHSignUpPasswordWorker,
        secureSessionService: ITCHSecureSessionLogic,
        userRoleService: ITCHUserRoleLogic,
        email: String
    ) {
        self.presenter = presenter
        self.networkService = networkService
        self.secureSessionService = secureSessionService
        self.userRoleService = userRoleService
        self.email = email
    }
    
    // MARK: - Methods
    func loadCourses(with password: String) {
        networkService.sendPassword(
            with: ITCHSignUpPassword.Network.ITCHDTOPassword(
                email: email,
                password: password
            ), completion: { [weak self] result in
                switch result {
                case .success(let model):
                    guard let model else { return }
                    
                    self?.secureSessionService.set(
                        tokensModel: ITCHAccessToken(
                            token: model.token,
                            refreshToken: model.refreshToken
                        )
                    )
                    
                    self?.userRoleService.set(for: model.token, with: self?.email ?? "")
                    
                    DispatchQueue.main.async {
                        self?.presenter.routeToCourses()
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        )
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
