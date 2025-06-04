//
//  ITCHAddMembersAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHCore
import ITCHNetworking

final class ITCHAddMembersAssembly {
    static func build(with id: Int, actionOnDismiss: (() -> Void)?) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHAddMembersService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHAddMembersPresenter(actionOnDismiss: actionOnDismiss)
        let interactor = ITCHAddMembersInteractor(
            with: id,
            presenter: presenter,
            networkService: networkService,
            secureService: secureService
        )
        let view = ITCHAddMembersViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
