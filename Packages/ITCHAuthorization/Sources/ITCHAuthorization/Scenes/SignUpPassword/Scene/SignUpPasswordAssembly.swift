//
//  SignUpPasswordAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit

final class SignUpPasswordAssembly {
    static func build() -> UIViewController {
        let presenter = SignUpPasswordPresenter()
        let interactor = SignUpPasswordInteractor(presenter: presenter)
        let view = SignUpPasswordViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
