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
    func presentStart(with model: ITCHCourseEditorModel?) {
        view?.displayStart(with: model)
    }
}

// MARK: - RouterLogic
extension ITCHCourseEditorPresenter: ITCHCourseEditorRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToCreateSchedule(with model: ITCHCourseEditorModel?) {
        guard let model else { return }
        
        /// A separate model may be required
        view?.navigationController?.pushViewController(
            ITCHScheduleEditorAssembly.build(
                createWith: ITCHCurrentCourseModel(
                    courseName: model.name,
                    teacherName: "Сосновский Григорий Михайлович",
                    avatar: nil,
                    locationDuration: [model.duration, model.location],
                    role: "TEACHER",
                    chatLink: model.chatLink,
                    gradesLink: model.gradesLink,
                    dayOfWeek: "",
                    numberOfHours: 0,
                    time: "",
                    frequency: ""
                )
            ),
            animated: true
        )
    }
}
