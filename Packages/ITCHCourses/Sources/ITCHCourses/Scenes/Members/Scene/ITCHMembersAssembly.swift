//
//  ITCHMembersAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHCore
import ITCHNetworking

final class ITCHMembersAssembly {
    static func build(with id: Int) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHMembersService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHMembersPresenter()
        let interactor = ITCHMembersInteractor(
            with: id,
            presenter: presenter,
            networkService: networkService,
            secureService: secureService
        )
        
        let view = ITCHMembersViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
