//
//  ITCHRecordEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHCore
import ITCHNetworking

final class ITCHRecordEditorAssembly {
    static func build(
        for id: Int,
        with model: ITCHRecordEditorModel.Local.ITCHRecord? = nil,
        actionOnDismiss: (() -> Void)?
    ) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHRecordEditorService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHRecordEditorPresenter(actionOnDismiss: actionOnDismiss)
        let interactor = ITCHRecordEditorInteractor(
            for: id,
            presenter: presenter,
            with: model,
            networkService: networkService,
            secureService: secureService
        )
        
        let view = ITCHRecordEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
