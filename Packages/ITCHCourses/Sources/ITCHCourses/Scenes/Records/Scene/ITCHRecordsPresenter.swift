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
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
