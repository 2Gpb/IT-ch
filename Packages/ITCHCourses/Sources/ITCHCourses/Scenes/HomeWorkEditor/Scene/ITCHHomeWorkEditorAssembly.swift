//
//  ITCHHomeWorkEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHNetworking
import ITCHCore

final class ITCHHomeWorkEditorAssembly {
    static func build(
        for id: Int,
        with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork? = nil,
        actionOnDismiss: (() -> Void)?
    ) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHHomeWorksEditorService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHHomeWorkEditorPresenter(actionOnDismiss: actionOnDismiss)
        let interactor = ITCHHomeWorkEditorInteractor(
            for: id,
            presenter: presenter,
            with: model,
            networkService: networkService,
            secureService: secureService
        )
        
        let view = ITCHHomeWorkEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
