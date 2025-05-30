//
//  ITCHSignUpAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHNetworking

final class ITCHSignUpAssembly {
    static func build(with fullName: String) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8080")
        let service = ITCHSignUpService(networking: worker)
        let presenter = ITCHSignUpPresenter()
        let interactor = ITCHSignUpInteractor(presenter: presenter, service: service, fullName: fullName)
        let view = ITCHSignUpViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
