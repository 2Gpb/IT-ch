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
    func presentStart(for role: ITCHCourseUserRole) {
        view?.displayStart(for: role)
    }
    
    func presentRecords(isEmpty: Bool) {
        view?.displayRecords(isEmpty: isEmpty)
    }
}

// MARK: - RouterLogic
extension ITCHRecordsPresenter: ITCHRecordsRouterLogic {
    func routeToAddRecord(with id: Int, actionOnDismiss: (() -> Void)?) {
        view?.present(ITCHRecordEditorAssembly.build(for: id, actionOnDismiss: actionOnDismiss), animated: true)
    }
    
    func routeToOpenRecord(with link: String?) {
        link?.openURL()
    }
    
    func routeToEditRecord(for id: Int, with model: ITCHRecordModel?, actionOnDismiss: (() -> Void)?) {
        view?.present(
            ITCHRecordEditorAssembly.build(
                for: id,
                with: model,
                actionOnDismiss: actionOnDismiss
            ),
            animated: true
        )
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
