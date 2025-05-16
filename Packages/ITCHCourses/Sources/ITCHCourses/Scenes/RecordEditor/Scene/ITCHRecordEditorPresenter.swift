//
//  ITCHRecordEditorPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHRecordEditorPresenter: ITCHRecordEditorPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHRecordEditorViewController?
    
    // MARK: - Methods
    func presentStart(with model: ITCHRecordModel?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHRecordEditorPresenter: ITCHRecordEditorRouterLogic {
    func popViewController() {
        view?.dismiss(animated: true)
    }
}
