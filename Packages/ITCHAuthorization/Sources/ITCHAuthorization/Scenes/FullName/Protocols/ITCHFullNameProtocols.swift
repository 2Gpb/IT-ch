//
//  ITCHFullNameProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

protocol ITCHFullNameBusinessLogic {
    func loadSignUp()
    func loadDismiss()
}

protocol ITCHFullNamePresentationLogic { }

protocol ITCHFullNameRouterLogic {
    func routeToSignUp()
    func popViewController()
}
