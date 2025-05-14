//
//  ITCHAddMembersAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

final class ITCHAddMembersAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHAddMembersPresenter()
        let interactor = ITCHAddMembersInteractor(presenter: presenter)
        let view = ITCHAddMembersViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
