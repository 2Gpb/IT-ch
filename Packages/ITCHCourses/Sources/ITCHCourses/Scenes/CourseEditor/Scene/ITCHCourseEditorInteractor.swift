//
//  ITCHCourseEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

final class ITCHCourseEditorInteractor: ITCHCourseEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic
    private let mode: ITCHEditingMode
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic,
        for mode: ITCHEditingMode
    ) {
        self.presenter = presenter
        self.mode = mode
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: mode)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
