//
//  ITCHRecordsInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHRecordsInteractor: ITCHRecordsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHRecordsPresentationLogic & ITCHRecordsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
