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
    func presentStart(with model: ITCHCourseEditorModel.Local.ITCHCourse?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHCourseEditorPresenter: ITCHCourseEditorRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToCreateSchedule(with model: ITCHCourseEditorModel.Local.ITCHCourse?) {
        guard let model else { return }
        
        view?.navigationController?.pushViewController(
            ITCHScheduleEditorAssembly.build(createWith: model), animated: true
        )
    }
}
