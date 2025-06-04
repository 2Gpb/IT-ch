//
//  ITCHLoginProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import ITCHNetworking

protocol ITCHLoginBusinessLogic {
    func loadCourses(email: String, password: String)
    func loadDismiss()
    func loadPasswordRecovery()
}

protocol ITCHLoginPresentationLogic {
    func presentError()
}

protocol ITCHLoginRouterLogic {
    func routeToCourses()
    func popViewController()
    func routeToPasswordRecovery()
}

protocol ITCHLoginWorker {
    func sendPassword(
        with model: ITCHLoginModel.Network.ITCHDTOLogin,
        completion: ((Result<ITCHTokenResponse?, Error>) -> Void)?
    )
}
