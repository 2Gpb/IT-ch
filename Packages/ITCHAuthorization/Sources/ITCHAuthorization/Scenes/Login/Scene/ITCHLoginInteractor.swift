//
//  ITCHLoginInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import Foundation
import ITCHNetworking
import ITCHCore
import ITCHUtilities

final class ITCHLoginInteractor: ITCHLoginBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic
    private let networkService: ITCHLoginWorker
    private let secureSessionService: ITCHSecureSessionLogic
    private let userRoleService: ITCHUserRoleLogic
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHLoginPresentationLogic & ITCHLoginRouterLogic,
        networkService: ITCHLoginWorker,
        secureSessionService: ITCHSecureSessionLogic,
        userRoleService: ITCHUserRoleLogic
    ) {
        self.presenter = presenter
        self.networkService = networkService
        self.secureSessionService = secureSessionService
        self.userRoleService = userRoleService
    }
    
    // MARK: - Methods
    func loadCourses(email: String, password: String) {
        networkService.sendPassword(
            with: ITCHLoginModel.Network.ITCHDTOLogin(
                email: email,
                password: password
            ),
            completion: { [weak self] result in
                switch result {
                case .success(let model):
                    guard let model else { return }
                    print(model.token)
                    print(model.refreshToken)
                    
                    self?.secureSessionService.set(
                        tokensModel: ITCHAccessToken(
                            token: model.token,
                            refreshToken: model.refreshToken
                        )
                    )
                    
                    self?.userRoleService.set(for: model.token, with: email)
                    
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
