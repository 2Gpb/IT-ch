//
//  ITCHInfoProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

protocol ITCHInfoBusinessLogic {
    func loadStart()
    func loadDismiss()
}

protocol ITCHInfoPresentationLogic {
    func presentStart(with model: ITCHInfoModel)
}

protocol ITCHInfoRouterLogic {
    func popViewController()
}
