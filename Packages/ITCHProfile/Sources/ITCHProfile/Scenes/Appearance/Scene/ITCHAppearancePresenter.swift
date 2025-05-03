//
//  ITCHAppearancePresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHAppearancePresenter: ITCHAppearancePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHAppearanceViewController?
}

// MARK: - RouterLogic
extension ITCHAppearancePresenter: ITCHAppearanceRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
