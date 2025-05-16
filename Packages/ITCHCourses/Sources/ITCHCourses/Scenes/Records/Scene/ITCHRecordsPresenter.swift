//
//  ITCHRecordsPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import ITCHUtilities

final class ITCHRecordsPresenter: ITCHRecordsPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHRecordsViewController?
    
    // MARK: - Methods
    func presentStart(for role: ITCHCourseUserRole, isEmpty: Bool) {
        view?.displayStart(for: role, isEmpty: isEmpty)
    }
}

// MARK: - RouterLogic
extension ITCHRecordsPresenter: ITCHRecordsRouterLogic {
    func routeToAddRecord() {
        view?.present(ITCHRecordEditorAssembly.build(), animated: true)
    }
    
    func routeToOpenRecord(with link: String?) {
        link?.openURL()
    }
    
    func routeToEditRecord(with model: ITCHRecordModel?) {
        view?.present(ITCHRecordEditorAssembly.build(with: model), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
