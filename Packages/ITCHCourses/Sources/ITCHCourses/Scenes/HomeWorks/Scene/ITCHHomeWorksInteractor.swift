//
//  ITCHHomeWorksInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorksInteractor: ITCHHomeWorksBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHHomeWorksPresentationLogic & ITCHHomeWorksRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
