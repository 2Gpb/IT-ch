//
//  ITCHWelcomeInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

final class ITCHWelcomeInteractor: ITCHWelcomeBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHWelcomePresentationLogic & ITCHWelcomeRouterLogic) {
        self.presenter = presenter
    }
}
