//
//  ITCHAboutAppAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHAboutAppAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHAboutAppPresenter()
        let interactor = ITCHAboutAppInteractor(presenter: presenter)
        let view = ITCHAboutAppViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
