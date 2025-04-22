//
//  ITCHCalendarProtocols.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit

protocol ITCHCalendarBusinessLogic: UITableViewDataSource { }

protocol ITCHCalendarPresentationLogic { }

protocol ITCHCalendarRouterLogic { }

@MainActor
protocol ITCHDeadlinesStorage {
    var deadlines: [ITCHDeadlineModel] { get }
}
