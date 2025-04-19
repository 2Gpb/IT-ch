//
//  ITCHHelpQuestionsAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit

final class ITCHHelpQuestionsAssembly {
    @MainActor
    static func build() -> UIViewController {
        let presenter = ITCHHelpQuestionsPresenter()
        let interactor = ITCHHelpQuestionsInteractor(presenter: presenter)
        let view = ITCHHelpQuestionsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
