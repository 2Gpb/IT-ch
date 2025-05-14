//
//  ITCHHomeWorkEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorkEditorInteractor: ITCHHomeWorkEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic
    private let mode: ITCHEditingMode
    private let homeWork: ITCHHomeWorkModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic,
        for mode: ITCHEditingMode,
        with model: ITCHHomeWorkModel? = nil
    ) {
        self.presenter = presenter
        self.mode = mode
        self.homeWork = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(for: mode, with: homeWork)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
