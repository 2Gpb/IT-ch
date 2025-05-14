//
//  ITCHHomeWorksAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHHomeWorksAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHHomeWorksPresenter()
        let interactor = ITCHHomeWorksInteractor(presenter: presenter)
        let view = ITCHHomeWorksViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
