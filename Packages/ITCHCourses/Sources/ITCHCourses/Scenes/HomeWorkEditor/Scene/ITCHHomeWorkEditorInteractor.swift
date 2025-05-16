//
//  ITCHHomeWorkEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorkEditorInteractor: ITCHHomeWorkEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic
    private let homeWork: ITCHHomeWorkModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic,
        with model: ITCHHomeWorkModel? = nil
    ) {
        self.presenter = presenter
        self.homeWork = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: homeWork)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
