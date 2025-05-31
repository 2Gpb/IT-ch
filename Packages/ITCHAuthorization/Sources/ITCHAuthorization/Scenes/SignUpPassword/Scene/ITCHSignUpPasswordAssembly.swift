//
//  ITCHSignUpPasswordAssembly.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import UIKit
import ITCHNetworking

final class ITCHSignUpPasswordAssembly {
    static func build(with email: String) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8080")
        let service = ITCHSignUpPasswordService(networking: worker)
        let presenter = ITCHSignUpPasswordPresenter()
        let interactor = ITCHSignUpPasswordInteractor(presenter: presenter, service: service, email: email)
        let view = ITCHSignUpPasswordViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
