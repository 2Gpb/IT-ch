//
//  ITCHScheduleEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import ITCHNetworking

protocol ITCHScheduleEditorBusinessLogic {
    func loadStart()
    func loadCourses()
    func loadChangeSchedule(with model: ITCHScheduleEditorModel)
    func loadCreate(with model: ITCHScheduleEditorModel)
    func loadDismiss()
}

protocol ITCHScheduleEditorPresentationLogic {
    func presentStart(with model: ITCHScheduleEditorModel?)
}

protocol ITCHScheduleEditorRouterLogic {
    func routeToCourses()
    func popViewController()
}

protocol ITCHScheduleWorker {
    func sendCourseInfo(
        for token: String,
        model: ITCHCreateCourseModel.Network.ITCHDTOCreateCourse,
        completion: ((Result<Void?, Error>) -> Void)?
    )
}
