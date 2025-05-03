//
//  ITCHAppearanceAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

public final class ITCHAppearanceAssembly {
    public static func build() -> UIViewController {
        let presenter = ITCHAppearancePresenter()
        let interactor = ITCHAppearanceInteractor(presenter: presenter)
        let view = ITCHAppearanceViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
