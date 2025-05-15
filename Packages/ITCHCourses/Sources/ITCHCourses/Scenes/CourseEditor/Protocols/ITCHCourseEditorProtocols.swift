//
//  ITCHCourseEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

protocol ITCHCourseEditorBusinessLogic {
    func loadStart()
    func loadChangeCourse(with model: ITCHCourseEditorModel)
    func loadDismiss()
    func loadCreateSchedule(with model: ITCHCourseEditorModel)
}

protocol ITCHCourseEditorPresentationLogic {
    func presentStart(with model: ITCHCourseEditorModel?)
}

protocol ITCHCourseEditorRouterLogic {
    func popViewController()
    func routeToCreateSchedule(with model: ITCHCourseEditorModel?)
}
