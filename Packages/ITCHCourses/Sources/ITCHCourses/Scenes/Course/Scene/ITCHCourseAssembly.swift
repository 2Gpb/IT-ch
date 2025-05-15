//
//  ITCHCourseAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHUtilities

final class ITCHCourseAssembly {
    static func build(for role: ITCHCourseUserRole, with model: ITCHCurrentCourseModel) -> UIViewController {
        let presenter = ITCHCoursePresenter()
        let interactor = ITCHCourseInteractor(presenter: presenter, for: role, with: model)
        let view = ITCHCourseViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
