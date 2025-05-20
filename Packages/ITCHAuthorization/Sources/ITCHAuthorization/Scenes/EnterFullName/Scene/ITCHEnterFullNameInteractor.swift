//
//  EnterFullNameInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

final class ITCHEnterFullNameInteractor: ITCHEnterFullNameBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHEnterFullNamePresentationLogic & ITCHEnterFullNameRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHEnterFullNamePresentationLogic & ITCHEnterFullNameRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
