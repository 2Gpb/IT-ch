//
//  ITCHProfileAssembly.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit

public final class ITCHProfileAssembly {
    public static func build() -> UIViewController {
        let presenter = ITCHProfilePresenter()
        let interactor = ITCHProfileInteractor(presenter: presenter)
        let view = ITCHProfileViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
