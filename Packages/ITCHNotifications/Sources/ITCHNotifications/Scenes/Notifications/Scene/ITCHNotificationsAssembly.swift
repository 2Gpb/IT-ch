//
//  ITCHNotificationsAssembly.swift
//  ITCHNotifications
//
//  Created by Peter on 30.04.2025.
//

import UIKit

public final class ITCHNotificationsAssembly {
    public static func build() -> UIViewController {
        let presenter = ITCHNotificationsPresenter()
        let interactor = ITCHNotificationsInteractor(presenter: presenter)
        let view = ITCHNotificationsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
