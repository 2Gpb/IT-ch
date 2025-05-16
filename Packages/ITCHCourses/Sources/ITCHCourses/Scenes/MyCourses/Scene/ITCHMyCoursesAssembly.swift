//
//  ITCHMyCoursesAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit

public final class ITCHMyCoursesAssembly {
    public static func build() -> UIViewController {
        let presenter = ITCHMyCoursesPresenter()
        let interactor = ITCHMyCoursesInteractor(presenter: presenter)
        let view = ITCHMyCoursesViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
