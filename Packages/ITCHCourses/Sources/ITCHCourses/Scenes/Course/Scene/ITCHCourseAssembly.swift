//
//  ITCHCourseAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit

final class ITCHCourseAssembly {
    static func build(with model: ITCHCourseModel) -> UIViewController {
        let presenter = ITCHCoursePresenter()
        let interactor = ITCHCourseInteractor(presenter: presenter, model: model)
        let view = ITCHCourseViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
