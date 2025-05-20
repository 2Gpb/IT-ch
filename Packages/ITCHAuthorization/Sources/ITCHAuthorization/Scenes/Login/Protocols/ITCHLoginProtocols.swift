//
//  ITCHLoginProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

protocol ITCHLoginBusinessLogic {
    func loadCourses()
    func loadDismiss()
    func loadPasswordRecovery()
}

protocol ITCHLoginPresentationLogic { }

protocol ITCHLoginRouterLogic {
    func routeToCourses()
    func popViewController()
    func routeToPasswordRecovery()
}
