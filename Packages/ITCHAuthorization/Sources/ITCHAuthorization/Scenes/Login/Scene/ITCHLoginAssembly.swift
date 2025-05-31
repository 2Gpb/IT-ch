//
//  Untitled.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHLoginAssembly {
    static func build() -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8080")
        let networkService = ITCHLoginService(networking: worker)
        let userRoleService = ITCHUserRoleService()
        let secureSessionService = ITCHSecureSessionService()
        let presenter = ITCHLoginPresenter()
        let interactor = ITCHLoginInteractor(
            presenter: presenter,
            networkService: networkService,
            secureSessionService: secureSessionService,
            userRoleService: userRoleService
        )
        
        let view = ITCHLoginViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
