//
//  ITCHProfileProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

protocol ITCHProfileBusinessLogic {
    func loadStart()
}

protocol ITCHProfilePresentationLogic {
    func presentStart(with model: ITCHAccountModel)
}

protocol ITCHProfileRouterLogic { }
