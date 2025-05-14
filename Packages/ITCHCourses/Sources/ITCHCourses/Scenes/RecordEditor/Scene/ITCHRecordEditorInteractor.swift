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
    private let record: ITCHRecordModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic,
        for mode: ITCHEditingMode,
        with model: ITCHRecordModel? = nil
    ) {
        self.presenter = presenter
        self.mode = mode
        self.record = model
    }
    
    // MARK: - Methods
    
    func loadStart() {
        presenter.presentStart(for: mode, with: record)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
