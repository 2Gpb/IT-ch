//
//  IT.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

protocol ITCHWelcomeBusinessLogic {
    func loadSelectAccount()
    func loadFullName()
    func loadReadMore()
}

protocol ITCHWelcomePresentationLogic { }

protocol ITCHWelcomeRouterLogic {
    func routeToSelectAccount()
    func routeToFullName()
    func routeToReadMore()
}
