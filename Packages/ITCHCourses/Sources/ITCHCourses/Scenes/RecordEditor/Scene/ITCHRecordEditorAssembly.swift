//
//  ITCHRecordEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHRecordEditorAssembly {
    static func build(with model: ITCHRecordModel? = nil) -> UIViewController {
        let presenter = ITCHRecordEditorPresenter()
        let interactor = ITCHRecordEditorInteractor(presenter: presenter, with: model)
        let view = ITCHRecordEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
