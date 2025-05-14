//
//  ITCHRecordsAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHRecordsAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHRecordsPresenter()
        let interactor = ITCHRecordsInteractor(presenter: presenter)
        let view = ITCHRecordsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
