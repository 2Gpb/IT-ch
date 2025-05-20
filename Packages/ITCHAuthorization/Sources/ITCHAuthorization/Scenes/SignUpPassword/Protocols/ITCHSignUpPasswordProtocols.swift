//
//  ITCHSignUpPasswordProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

protocol ITCHSignUpPasswordBusinessLogic {
    func loadEnterFullName()
    func loadDismiss()
}

protocol ITCHSignUpPasswordPresentationLogic { }

protocol ITCHSignUpPasswordRouterLogic {
    func routeToEnterFullName()
    func popViewController()
}
