//
//  Untitled.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHNetworking

final class ITCHLoginAssembly {
    static func build() -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8080")
        let service = ITCHLoginService(networking: worker)
        let presenter = ITCHLoginPresenter()
        let interactor = ITCHLoginInteractor(presenter: presenter, service: service)
        let view = ITCHLoginViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
