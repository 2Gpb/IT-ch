//
//  ITCHLanguageAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHLanguageAssembly {
    static func build() -> UIViewController {
        let presenter = ITCHLanguagePresenter()
        let interactor = ITCHLanguageInteractor(presenter: presenter)
        let view = ITCHLanguageViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
