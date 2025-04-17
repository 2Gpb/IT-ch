//
//  ITCHSelectAccountAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit

final class ITCHSelectAccountAssembly {
    @MainActor
    static func build() -> UIViewController {
        let presenter = ITCHSelectAccountPresenter()
        let interactor = ITCHSelectAccountInteractor(presenter: presenter)
        let view = ITCHSelectAccountViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
