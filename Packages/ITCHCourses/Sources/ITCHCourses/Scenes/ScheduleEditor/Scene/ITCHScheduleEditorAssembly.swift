//
//  ITCHScheduleEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHScheduleEditorAssembly {
    static func build(
        for id: Int? = nil,
        createWith course: ITCHCourseEditorModel.Local.ITCHCourse? = nil,
        editWith model: ITCHScheduleEditorModel.Local.ITCHSchedule? = nil
    ) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHScheduleService(networking: worker)
        let secureSessionService = ITCHSecureSessionService()
        let presenter = ITCHScheduleEditorPresenter()
        let interactor = ITCHScheduleEditorInteractor(
            for: id ?? 0,
            presenter: presenter,
            networkService: networkService,
            secureService: secureSessionService,
            createWith: course,
            editWith: model
        )
        let view = ITCHScheduleEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
