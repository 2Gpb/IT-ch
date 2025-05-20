//
//  ITCHSignUpAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit

final class ITCHSignUpAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHSignUpPresenter()
        let interactor = ITCHSignUpInteractor(presenter: presenter)
        let view = ITCHSignUpViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
