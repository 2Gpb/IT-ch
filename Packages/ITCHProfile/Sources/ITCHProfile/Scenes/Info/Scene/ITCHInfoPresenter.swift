//
//  ITCHInfoPresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHInfoPresenter: ITCHInfoPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHInfoViewController?
    
    // MARK: - Methods
    func presentStart(with model: ITCHInfoModel) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHInfoPresenter: ITCHInfoRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
