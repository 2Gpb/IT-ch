//
//  ITCHCourseEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

protocol ITCHCourseEditorBusinessLogic {
    func loadStart()
    func loadDismiss()
    func loadCreateSchedule()
}

protocol ITCHCourseEditorPresentationLogic {
    func presentStart(with mode: ITCHEditingMode)
}

protocol ITCHCourseEditorRouterLogic {
    func popViewController()
    func routeToCreateSchedule(with mode: ITCHEditingMode)
}
