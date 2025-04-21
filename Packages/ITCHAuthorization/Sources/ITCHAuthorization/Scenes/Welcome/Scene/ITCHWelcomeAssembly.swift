//
//  ITCHWelcomeAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit

public final class ITCHWelcomeAssembly {
    @MainActor
    public static func build() -> UIViewController {
        let presenter = ITCHWelcomePresenter()
        let interactor = ITCHWelcomeInteractor(presenter: presenter)
        let view = ITCHWelcomeViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
