//
//  ITCHContactsAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHContactsAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHContactsPresenter()
        let interactor = ITCHContactsInteractor(presenter: presenter)
        let view = ITCHContactsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
