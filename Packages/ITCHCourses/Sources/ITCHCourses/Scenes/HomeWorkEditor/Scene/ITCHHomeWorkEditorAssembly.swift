//
//  ITCHHomeWorkEditorAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHHomeWorkEditorAssembly {
    static func build(with model: ITCHHomeWorkModel? = nil) -> UIViewController {
        let presenter = ITCHHomeWorkEditorPresenter()
        let interactor = ITCHHomeWorkEditorInteractor(presenter: presenter, with: model)
        let view = ITCHHomeWorkEditorViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
