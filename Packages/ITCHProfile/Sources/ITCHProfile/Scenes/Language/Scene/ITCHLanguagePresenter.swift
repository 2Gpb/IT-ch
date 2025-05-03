//
//  ITCHLanguagePresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHLanguagePresenter: ITCHLanguagePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHLanguageViewController?
}

// MARK: - RouterLogic
extension ITCHLanguagePresenter: ITCHLanguageRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
