//
//  ITCHCalendarInetactor.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

final class ITCHCalendarInteractor: ITCHCalendarBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCalendarPresentationLogic & ITCHCalendarRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHCalendarPresentationLogic & ITCHCalendarRouterLogic) {
        self.presenter = presenter
    }
}
