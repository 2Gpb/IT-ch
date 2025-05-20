//
//  ITCHSignUpProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

protocol ITCHSignUpBusinessLogic {
    func loadInfo()
    func loadCode()
    func loadDismiss()
}

protocol ITCHSignUpPresentationLogic { }

protocol ITCHSignUpRouterLogic {
    func routeToInfo()
    func routeToCode()
    func popViewController()
}
