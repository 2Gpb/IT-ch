//
//  ITCHSignUpPasswordAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHSignUpPasswordAssembly {
    static func build(with email: String) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8080")
        let networkService = ITCHSignUpPasswordService(networking: worker)
        let secureSessionService = ITCHSecureSessionService()
        let userRoleService = ITCHUserRoleService()
        let presenter = ITCHSignUpPasswordPresenter()
        let interactor = ITCHSignUpPasswordInteractor(
            presenter: presenter,
            networkService: networkService,
            secureSessionService: secureSessionService,
            userRoleService: userRoleService,
            email: email
        )
        
        let view = ITCHSignUpPasswordViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
