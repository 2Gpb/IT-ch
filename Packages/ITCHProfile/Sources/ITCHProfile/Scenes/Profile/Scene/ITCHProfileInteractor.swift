//
//  ITCHProfileInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

final class ITCHProfileInteractor: ITCHProfileBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic) {
        self.presenter = presenter
    }
}
