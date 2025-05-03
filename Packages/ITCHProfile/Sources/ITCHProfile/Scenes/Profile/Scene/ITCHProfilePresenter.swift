//
//  ITCHProfilePresenter.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

final class ITCHProfilePresenter: ITCHProfilePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHProfileViewController?
    
    // MARK: - Methods
    func presentStart(with model: ITCHAccountModel) {
        view?.dispayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHProfilePresenter: ITCHProfileRouterLogic {
    func routeToAppearance() {
        view?.navigationController?.pushViewController(ITCHAppearanceAssembly.build(), animated: true)
    }
    
    func routeToLanguage() { }
    
    func routeToAbout() { }
    
    func routeToHelp() { }
    
    func routeToExit() { }
}
