//
//  ITCHHomeWorkEditorPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorkEditorPresenter: ITCHHomeWorkEditorPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHomeWorkEditorViewController?
    private let actionOnDismiss: (() -> Void)?
    
    init(actionOnDismiss: (() -> Void)?) {
        self.actionOnDismiss = actionOnDismiss
    }
    
    // MARK: - Methods
    func presentStart(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHHomeWorkEditorPresenter: ITCHHomeWorkEditorRouterLogic {
    func popViewController() {
        actionOnDismiss?()
        view?.dismiss(animated: true)
    }
}
