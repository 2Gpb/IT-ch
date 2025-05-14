//
//  ITCHHomeWorksPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorksPresenter: ITCHHomeWorksPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHomeWorksViewController?
}

// MARK: - RouterLogic
extension ITCHHomeWorksPresenter: ITCHHomeWorksRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
