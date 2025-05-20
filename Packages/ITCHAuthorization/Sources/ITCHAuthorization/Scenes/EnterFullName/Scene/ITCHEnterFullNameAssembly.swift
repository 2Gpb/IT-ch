//
//  EnterFullNameAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit

final class ITCHEnterFullNameAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHEnterFullNamePresenter()
        let interactor = ITCHEnterFullNameInteractor(presenter: presenter)
        let view = ITCHEnterFullNameViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
