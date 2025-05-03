//
//  ITCHProfileProtocols.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

protocol ITCHProfileBusinessLogic {
    func loadStart()
    func loadAppearance()
    func loadLanguage()
    func loadAbout()
    func loadHelp()
    func loadExit()
}

protocol ITCHProfilePresentationLogic {
    func presentStart(with model: ITCHAccountModel)
}

protocol ITCHProfileRouterLogic {
    func routeToAppearance()
    func routeToLanguage()
    func routeToAbout()
    func routeToHelp()
    func routeToExit()
}
