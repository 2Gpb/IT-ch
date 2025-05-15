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
    func presentStart(with model: ITCHScheduleEditorModel?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHScheduleEditorPresenter: ITCHScheduleEditorRouterLogic {
    func routeToCourses() {
        view?.navigationController?.popToRootViewController(animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
