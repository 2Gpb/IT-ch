//
//  ITCHCourseEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit

final class ITCHCourseEditorAssembly {
    static func build(for mode: ITCHEditingMode) -> UIViewController {
        let presenter = ITCHCourseEditorPresenter()
        let interactor = ITCHCourseEditorInteractor(presenter: presenter, for: mode)
        let view = ITCHCourseEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
