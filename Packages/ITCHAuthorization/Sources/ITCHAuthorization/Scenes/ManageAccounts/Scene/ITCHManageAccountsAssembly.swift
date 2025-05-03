//
//  ITCHManageAccountsAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit

final class ITCHManageAccountsAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHManageAccountsPresenter()
        let interactor = ITCHManageAccountsInteractor(presenter: presenter)
        let view = ITCHManageAccountsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
