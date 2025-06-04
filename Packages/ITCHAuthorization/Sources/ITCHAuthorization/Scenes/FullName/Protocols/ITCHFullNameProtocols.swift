//
//  ITCHFullNameProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

protocol ITCHFullNameBusinessLogic {
    func loadSignUp(with fullname: String)
    func loadDismiss()
}

protocol ITCHFullNamePresentationLogic { }

protocol ITCHFullNameRouterLogic {
    func routeToSignUp(with fullname: String)
    func popViewController()
}
