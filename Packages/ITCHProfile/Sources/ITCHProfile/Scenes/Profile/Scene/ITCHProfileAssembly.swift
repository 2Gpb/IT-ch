//
//  ITCHProfileAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHCore

public final class ITCHProfileAssembly {
    public static func build(exitAction: @escaping () -> Void) -> UIViewController {
        let userRoleService = ITCHUserRoleService()
        let secureSessionService = ITCHSecureSessionService()
        let presenter = ITCHProfilePresenter(exitAction: exitAction)
        let interactor = ITCHProfileInteractor(
            presenter: presenter,
            userRoleService: userRoleService,
            secureSessionService: secureSessionService
        )
        let view = ITCHProfileViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
