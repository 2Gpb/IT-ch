//
//  ITCHAboutAppInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHAboutAppInteractor: ITCHAboutAppBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAboutAppPresentationLogic & ITCHAboutAppRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHAboutAppPresentationLogic & ITCHAboutAppRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
