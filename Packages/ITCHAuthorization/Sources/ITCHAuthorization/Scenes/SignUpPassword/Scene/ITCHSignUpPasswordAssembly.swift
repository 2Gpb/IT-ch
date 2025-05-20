//
//  ITCHSignUpPasswordAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit

final class ITCHSignUpPasswordAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHSignUpPasswordPresenter()
        let interactor = ITCHSignUpPasswordInteractor(presenter: presenter)
        let view = ITCHSignUpPasswordViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
