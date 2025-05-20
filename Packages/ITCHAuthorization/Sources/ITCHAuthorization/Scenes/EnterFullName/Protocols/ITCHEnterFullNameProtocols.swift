//
//  ITCHEnterFullNameProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

protocol ITCHEnterFullNameBusinessLogic {
    func loadCourses()
    func loadDismiss()
}

protocol ITCHEnterFullNamePresentationLogic { }

protocol ITCHEnterFullNameRouterLogic {
    func routeToCourses()
    func popViewController()
}
