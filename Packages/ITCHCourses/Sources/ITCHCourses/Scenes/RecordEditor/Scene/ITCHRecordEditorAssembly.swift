//
//  ITCHRecordEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHRecordEditorAssembly {
    static func build(for mode: ITCHEditingMode) -> UIViewController {
        let presenter = ITCHRecordEditorPresenter()
        let interactor = ITCHRecordEditorInteractor(presenter: presenter, for: mode)
        let view = ITCHRecordEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
