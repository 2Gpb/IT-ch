//
//  ITCHSignUpProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import ITCHNetworking

protocol ITCHSignUpBusinessLogic {
    func loadInfo()
    func loadCode(with email: String)
    func loadDismiss()
}

protocol ITCHSignUpPresentationLogic { }

protocol ITCHSignUpRouterLogic {
    func routeToInfo()
    func routeToCode(with email: String)
    func popViewController()
}

protocol ITCHSignUpWorker {
    func sendUserInfo(
        with model: ITCHSignUp.Network.ITCHDTOFullName,
        completion: ((Result<ITCHErrorResponse?, Error>) -> Void)?
    )
}
