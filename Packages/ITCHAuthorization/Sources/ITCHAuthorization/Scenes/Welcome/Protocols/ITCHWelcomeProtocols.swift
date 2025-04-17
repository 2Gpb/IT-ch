//
//  IT.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

@MainActor
protocol ITCHWelcomeBusinessLogic {
    func loadSelectAccount()
}

protocol ITCHWelcomePresentationLogic { }

@MainActor
protocol ITCHWelcomeRouterLogic {
    func routeToSelectAccount()
}
