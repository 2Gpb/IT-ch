//
//  ITCHRecordEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHRecordEditorInteractor: ITCHRecordEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic
    private let record: ITCHRecordModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic,
        with model: ITCHRecordModel? = nil
    ) {
        self.presenter = presenter
        self.record = model
    }
    
    // MARK: - Methods
    
    func loadStart() {
        presenter.presentStart(with: record)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
