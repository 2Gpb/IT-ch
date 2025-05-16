//
//  ITCHCourseEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

final class ITCHCourseEditorInteractor: ITCHCourseEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic
    
    // MARK: - Variables
    private var course: ITCHCourseEditorModel?
    
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
    
    func loadChangeCourse(with model: ITCHCourseEditorModel) {
        course = model
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadCreateSchedule(with model: ITCHCourseEditorModel) {
        presenter.routeToCreateSchedule(with: model)
    }
}
