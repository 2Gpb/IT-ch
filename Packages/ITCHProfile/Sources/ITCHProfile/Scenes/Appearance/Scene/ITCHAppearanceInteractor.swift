//
//  ITCHAppearanceInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHAppearanceInteractor: ITCHAppearanceBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHAppearancePresentationLogic & ITCHAppearanceRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
