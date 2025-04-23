//
//  ITCHCalendarPresenter.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

final class ITCHCalendarPresenter: ITCHCalendarPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHCalendarViewController?
}

// MARK: - RouterLogic
extension ITCHCalendarPresenter: ITCHCalendarRouterLogic { }
