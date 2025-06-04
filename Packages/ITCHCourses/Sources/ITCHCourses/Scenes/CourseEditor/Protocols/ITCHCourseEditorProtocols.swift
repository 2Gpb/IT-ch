//
//  ITCHCourseEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

protocol ITCHCourseEditorBusinessLogic {
    func loadStart()
    func loadChangeCourse(with model: ITCHCourseEditorModel.Local.ITCHCourse)
    func loadDismiss()
    func loadCreateSchedule(with model: ITCHCourseEditorModel.Local.ITCHCourse)
}

protocol ITCHCourseEditorPresentationLogic {
    func presentStart(with model: ITCHCourseEditorModel.Local.ITCHCourse?)
}

protocol ITCHCourseEditorRouterLogic {
    func popViewController()
    func routeToCreateSchedule(with model: ITCHCourseEditorModel.Local.ITCHCourse?)
}

protocol ITCHCourseEditorWorker {
    func changeCourse(
        for token: String,
        with id: Int,
        model: ITCHCourseEditorModel.Network.ITCHCourse,
        completion: ((Result<ITCHCourseEditorModel.Network.ITCHCourse?, Error>) -> Void)?
    )
}
