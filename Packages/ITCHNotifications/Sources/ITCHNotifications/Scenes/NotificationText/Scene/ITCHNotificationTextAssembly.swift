//
//  ITCHNotificationTextAssembly.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

import UIKit

final class ITCHNotificationTextAssembly {
    static func build(with model: ITCHNotificationTextModel) -> UIViewController {
        let presenter = ITCHNotificationTextPresenter()
        let interactor = ITCHNotificationTextInteractor(presenter: presenter, model: model)
        let view = ITCHNotificationTextViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
