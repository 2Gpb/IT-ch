//
//  ITCHCourseAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHCore
import ITCHNetworking
import ITCHUtilities

final class ITCHCourseAssembly {
    static func build(with id: Int) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHCourseService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHCoursePresenter()
        let interactor = ITCHCourseInteractor(
            with: id,
            presenter: presenter,
            networkService: networkService,
            secureService: secureService
        )
        
        let view = ITCHCourseViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
