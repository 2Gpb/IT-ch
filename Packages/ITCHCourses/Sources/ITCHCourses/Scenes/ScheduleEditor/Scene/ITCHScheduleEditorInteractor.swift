//
//  ITCHScheduleEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

final class ITCHScheduleEditorInteractor: ITCHScheduleEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic
    private var course: ITCHCurrentCourseModel?
    private var schedule: ITCHScheduleEditorModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic,
        createWith course: ITCHCurrentCourseModel?,
        editWith model: ITCHScheduleEditorModel?
    ) {
        self.presenter = presenter
        self.course = course
        self.schedule = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: schedule)
    }
    
    func loadCreate(with model: ITCHScheduleEditorModel) {
        course?.dayOfWeek = model.dayOfWeek
        course?.numberOfHours = model.numberOfHours
        course?.time = model.time
        course?.frequency = model.frequency
    }
    
    func loadChangeSchedule(with model: ITCHScheduleEditorModel) {
        schedule = model
    }
    
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
