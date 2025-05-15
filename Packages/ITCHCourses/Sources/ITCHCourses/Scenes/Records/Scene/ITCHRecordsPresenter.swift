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
        view?.present(ITCHRecordEditorAssembly.build(), animated: true)
    }
    
    func routeToEditRecord(with model: ITCHRecordModel?) {
        view?.present(ITCHRecordEditorAssembly.build(with: model), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
