//
//  ITCHCourseEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

final class ITCHCourseEditorInteractor: ITCHCourseEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic
    private let course: ITCHCourseEditorModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic,
        with model: ITCHCourseEditorModel?
    ) {
        self.presenter = presenter
        self.course = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: course)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadCreateSchedule() {
        presenter.routeToCreateSchedule()
    }
}
