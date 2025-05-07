//
//  ITCHScheduleEditorPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

final class ITCHScheduleEditorPresenter: ITCHScheduleEditorPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHScheduleEditorViewController?
    
    // MARK: - Methods
    func presentStart(with mode: ITCHEditingMode) {
        view?.displayStart(with: mode)
    }
}

// MARK: - RouterLogic
extension ITCHScheduleEditorPresenter: ITCHScheduleEditorRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
