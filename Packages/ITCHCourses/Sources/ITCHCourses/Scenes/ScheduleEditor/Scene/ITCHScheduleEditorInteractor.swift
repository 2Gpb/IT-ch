//
//  ITCHScheduleEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

final class ITCHScheduleEditorInteractor: ITCHScheduleEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic
    private let schedule: ITCHScheduleEditorModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic,
        with model: ITCHScheduleEditorModel?
    ) {
        self.presenter = presenter
        self.schedule = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: schedule)
    }
    
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
