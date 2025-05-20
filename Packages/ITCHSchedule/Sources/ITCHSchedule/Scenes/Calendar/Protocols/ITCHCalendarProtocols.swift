//
//  ITCHCalendarProtocols.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit

protocol ITCHCalendarBusinessLogic: UITableViewDataSource {
    var tableType: ITCHScheduleTableType { get set }
}

protocol ITCHCalendarPresentationLogic { }

protocol ITCHCalendarRouterLogic { }

protocol ITCHDeadlinesStorage {
    var deadlines: [ITCHDeadlineModel] { get }
}

protocol ITCHScheduleStorage {
    var scheduleSections: [ITCHScheduleSection] { get }
}
