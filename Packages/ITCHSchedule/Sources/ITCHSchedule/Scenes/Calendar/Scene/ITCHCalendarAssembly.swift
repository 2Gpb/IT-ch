//
//  ITCHCalendarAssembly.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit

public final class ITCHCalendarAssembly {
    @MainActor
    public static func build() -> UIViewController {
        let presenter = ITCHCalendarPresenter()
        let interactor = ITCHCalendarInteractor(presenter: presenter)
        let view = ITCHCalendarViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
