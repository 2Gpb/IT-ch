//
//  ITCHRecordsPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHRecordsPresenter: ITCHRecordsPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHRecordsViewController?
}

// MARK: - RouterLogic
extension ITCHRecordsPresenter: ITCHRecordsRouterLogic {
    func routeToAddRecord() {
        view?.present(ITCHRecordEditorAssembly.build(for: .create), animated: true)
    }
    
    func routeToEditRecord() {
        view?.present(ITCHRecordEditorAssembly.build(for: .edit), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
