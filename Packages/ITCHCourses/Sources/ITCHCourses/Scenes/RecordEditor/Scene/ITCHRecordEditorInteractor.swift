//
//  ITCHRecordEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHRecordEditorInteractor: ITCHRecordEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic
    private let mode: ITCHEditingMode
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic,
        for mode: ITCHEditingMode
    ) {
        self.presenter = presenter
        self.mode = mode
    }
    
    // MARK: - Methods
    
    func loadStart() {
        presenter.presentStart(with: mode)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
