//
//  ITCHProfilePresenter.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

final class ITCHProfilePresenter: ITCHProfilePresentationLogic {
    // MARK: - Variables
    weak var view: ITCHProfileViewController?
}

// MARK: - RouterLogic
extension ITCHProfilePresenter: ITCHProfileRouterLogic { }
