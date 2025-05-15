//
//  ITCHScheduleEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import UIKit

final class ITCHScheduleEditorAssembly {
    static func build(with model: ITCHScheduleEditorModel? = nil) -> UIViewController {
        let presenter = ITCHScheduleEditorPresenter()
        let interactor = ITCHScheduleEditorInteractor(presenter: presenter, with: model)
        let view = ITCHScheduleEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
