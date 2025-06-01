//
//  ITCHSplashAssembly.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHSplashAssembly {
    static func build() -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHSplashService(networking: worker)
        let secureSessionService = ITCHSecureSessionService()
        let userRoleService = ITCHUserRoleService()
        let presenter = ITCHSplashPresenter()
        let interactor = ITCHSplashInteractor(
            presenter: presenter,
            networkService: networkService,
            secureService: secureSessionService,
            userRoleService: userRoleService
        )
        
        let view = ITCHSplashViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
