//
//  ITCHMyCoursesAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHCore
import ITCHNetworking
import ITCHUtilities

public final class ITCHMyCoursesAssembly {
    public static func build() -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHMyCoursesService(networking: worker)
        let secureSessionService = ITCHSecureSessionService()
        let userRoleService = ITCHUserRoleService()
        let presenter = ITCHMyCoursesPresenter()
        let interactor = ITCHMyCoursesInteractor(
            presenter: presenter,
            networkService: networkService,
            secureSessionService: secureSessionService,
            userRoleService: userRoleService
        )
        
        let view = ITCHMyCoursesViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
