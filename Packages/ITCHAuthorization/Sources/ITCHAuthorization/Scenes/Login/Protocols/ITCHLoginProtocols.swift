//
//  ITCHLoginProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

@MainActor
protocol ITCHLoginBusinessLogic {
    func loadDismiss()
    func loadPasswordRecovery()
}

protocol ITCHLoginPresentationLogic {
    
}

@MainActor
protocol ITCHLoginRouterLogic {
    func popViewController()
    func routeToPasswordRecovery()
}
