//
//  ITCHRecordsAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities

final class ITCHRecordsAssembly {
    static func build(for role: ITCHCourseUserRole) -> UIViewController {
        let presenter = ITCHRecordsPresenter()
        let interactor = ITCHRecordsInteractor(presenter: presenter, for: role)
        let view = ITCHRecordsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
