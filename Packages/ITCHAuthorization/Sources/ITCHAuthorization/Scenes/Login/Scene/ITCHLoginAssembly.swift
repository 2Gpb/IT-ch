//
//  Untitled.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit

final class ITCHLoginAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHLoginPresenter()
        let interactor = ITCHLoginInteractor(presenter: presenter)
        let view = ITCHLoginViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
