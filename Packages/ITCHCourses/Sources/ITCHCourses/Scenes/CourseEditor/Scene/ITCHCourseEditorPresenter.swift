//
//  ITCHCourseEditorPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

final class ITCHCourseEditorPresenter: ITCHCourseEditorPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHCourseEditorViewController?
    
    // MARK: - Methods
    func presentStart(with mode: ITCHEditingMode) {
        view?.displayStart(with: mode)
    }
}

// MARK: - RouterLogic
extension ITCHCourseEditorPresenter: ITCHCourseEditorRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
