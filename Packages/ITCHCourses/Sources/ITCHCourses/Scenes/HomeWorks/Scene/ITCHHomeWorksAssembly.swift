//
//  ITCHHomeWorksAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities
import ITCHCore
import ITCHNetworking

final class ITCHHomeWorksAssembly {
    static func build(with id: Int, for role: ITCHCourseUserRole) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHHomeWorksService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHHomeWorksPresenter()
        let interactor = ITCHHomeWorksInteractor(
            presenter: presenter,
            id: id,
            for: role,
            networkService: networkService,
            secureService: secureService
        )
        let view = ITCHHomeWorksViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
