//
//  ITCHHomeWorkEditorPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorkEditorPresenter: ITCHHomeWorkEditorPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHomeWorkEditorViewController?
    
    // MARK: - Methods
    func presentStart(with model: ITCHHomeWorkModel?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHHomeWorkEditorPresenter: ITCHHomeWorkEditorRouterLogic {
    func popViewController() {
        view?.dismiss(animated: true)
    }
}
