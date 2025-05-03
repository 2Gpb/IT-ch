//
//  ITCHAboutAppPresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHAboutAppPresenter: ITCHAboutAppPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHAboutAppViewController?
}

// MARK: - RouterLogic
extension ITCHAboutAppPresenter: ITCHAboutAppRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
