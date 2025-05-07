//
//  ITCHScheduleEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

final class ITCHScheduleEditorInteractor: ITCHScheduleEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic
    private let mode: ITCHEditingMode
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic,
        for mode: ITCHEditingMode
    ) {
        self.presenter = presenter
        self.mode = mode
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: mode)
    }
    
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
