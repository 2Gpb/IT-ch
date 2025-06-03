//
//  ITCHSplashInteractor.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import Foundation
import ITCHCore
import ITCHNetworking
import ITCHUtilities

final class ITCHSplashInteractor: ITCHSplashBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHSplashPresentationLogic & ITCHSplashRouterLogic
    private let networkService: ITCHSplashWorker
    private let secureService: ITCHSecureSessionLogic
    private let userRoleService: ITCHUserRoleLogic
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHSplashPresentationLogic & ITCHSplashRouterLogic,
        networkService: ITCHSplashWorker,
        secureService: ITCHSecureSessionLogic,
        userRoleService: ITCHUserRoleLogic
    ) {
        self.presenter = presenter
        self.networkService = networkService
        self.secureService = secureService
        self.userRoleService = userRoleService
    }
    
    func checkAuth() {
        let tokensModel = secureService.get()
        
        guard let tokensModel else {
            presenter.routeToAuth()
            return
        }
        
        print(tokensModel.token)
        
        networkService.checkAccess(for: tokensModel.token) { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.presenter.routeToCourses()
                }
                
            case .failure(let error):
                if let error = error as? ITCHErrorResponse {
                    print("for jwt:", error.message)
                    self?.refreshToken(for: tokensModel.refreshToken)
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func refreshToken(for refreshToken: String) {
        let dtoModel = ITCHRefreshModel.Network.ITCHDTORefresh(refreshToken: refreshToken)
        networkService.refreshToken(for: dtoModel) { [weak self] result in
            switch result {
            case .success(let tokensModel):
                if let tokensModel {
                    self?.secureService.set(
                        tokensModel: ITCHAccessToken(
                            token: tokensModel.token,
                            refreshToken: tokensModel.refreshToken
                        )
                    )
                    
//                    self?.userRoleService.set(for: tokensModel.token, with: <#String#>)
                }
                
                DispatchQueue.main.async {
                    self?.presenter.routeToCourses()
                }
                
            case .failure(let error):
                if let error = error as? ITCHErrorResponse {
                    print("for refresh:", error.message)
                    
                    DispatchQueue.main.async {
                        self?.presenter.routeToAuth()
                    }
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
