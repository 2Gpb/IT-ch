//
//  ITCHHomeWorksAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities

final class ITCHHomeWorksAssembly {
    static func build(for role: ITCHCourseUserRole) -> UIViewController {
        let presenter = ITCHHomeWorksPresenter()
        let interactor = ITCHHomeWorksInteractor(presenter: presenter)
        let view = ITCHHomeWorksViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
