//
//  ITCHFullNameAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit

final class ITCHFullNameAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHFullNamePresenter()
        let interactor = ITCHFullNameInteractor(presenter: presenter)
        let view = ITCHFullNameViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
