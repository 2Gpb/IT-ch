//
//  ITCHCourseEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHCourseEditorAssembly {
    static func build(for id: Int? = nil, with model: ITCHCourseEditorModel.Local.ITCHCourse? = nil) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHCourseEditorService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHCourseEditorPresenter()
        let interactor = ITCHCourseEditorInteractor(
            for: id ?? 0,
            presenter: presenter,
            with: model,
            networkService: networkService,
            secureService: secureService
        )
        let view = ITCHCourseEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
