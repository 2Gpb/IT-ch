//
//  ITCHMembersAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit

final class ITCHMembersAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHMembersPresenter()
        let interactor = ITCHMembersInteractor(presenter: presenter)
        let view = ITCHMembersViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
