//
//  ITCHSignUpPasswordProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import ITCHNetworking

protocol ITCHSignUpPasswordBusinessLogic {
    func loadCourses(with password: String)
    func loadDismiss()
}

protocol ITCHSignUpPasswordPresentationLogic { }

protocol ITCHSignUpPasswordRouterLogic {
    func routeToCourses()
    func popViewController()
}

protocol ITCHSignUpPasswordWorker {
    func sendPassword(
        with model: ITCHSignUpPassword.Network.ITCHDTOPassword,
        completion: ((Result<ITCHTokenResponse?, Error>) -> Void)?
    )
}
