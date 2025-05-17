//
//  ITCHCalendarInetactor.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCalendarInteractor: NSObject, ITCHCalendarBusinessLogic, ITCHDeadlinesStorage, ITCHScheduleStorage {
    // MARK: - Private fields
    private let presenter: ITCHCalendarPresentationLogic & ITCHCalendarRouterLogic
    
    // MARK: - Variables
    var tableType: ITCHScheduleTableType = .schedule
    var deadlines: [ITCHDeadlineModel] = [
        ITCHDeadlineModel(
            course: "НИС “Основы iOS разработки на UIKit”",
            text: "Домашняя работа 5",
            deadline: Date(),
            isChecked: false
        ),
        ITCHDeadlineModel(
            course: "НИС “Основы iOS разработки на UIKit”",
            text: "Домашняя работа 5",
            deadline: Date(),
            isChecked: false
        )
    ]
    
    var scheduleSections: [ITCHScheduleSection] = [
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit” skvfklsnvld ksslkdjvlzdfj v svl",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”  skvfklsnvld ksslkdjvlzdfj v svl",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ITCHScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                ),
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHCalendarPresentationLogic & ITCHCalendarRouterLogic) {
        self.presenter = presenter
    }
}

// MARK: - UITableViewDataSource
extension ITCHCalendarInteractor: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableType == .schedule ? scheduleSections.count : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableType {
        case .schedule:
            /// with header
            scheduleSections[section].items.count + 1
        case .deadlines:
            deadlines.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableType {
        case .schedule:
            return makeScheduleCell(for: tableView, at: indexPath)
        case .deadlines:
            return makeDeadlineCell(for: tableView, at: indexPath)
        }
    }
}

// MARK: - Cells configure
extension ITCHCalendarInteractor {
    func makeScheduleCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return makeScheduleHeaderCell(for: tableView, section: indexPath.section)
        } else {
            return makeScheduleItemCell(for: tableView, indexPath: indexPath)
        }
    }
    
    func makeScheduleHeaderCell(for tableView: UITableView, section: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHScheduleHeaderCell.reuseId
        ) as? ITCHScheduleHeaderCell else {
            return UITableViewCell()
        }
        
        let date = scheduleSections[section].date
        cell.configure(with: date)
        return cell
    }
    
    func makeScheduleItemCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        /// without header
        let actualIndex = indexPath.row - 1
        let section = scheduleSections[indexPath.section]
        let model = section.items[actualIndex]
        let isLast = actualIndex == section.items.count - 1
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHScheduleCell.reuseId
        ) as? ITCHScheduleCell else {
            return UITableViewCell()
        }
        
        let viewModel = ITCHScheduleViewModel(
            courseName: model.courseName,
            location: model.location,
            timeInterval: model.timeInterval
        )
        
        cell.configure(with: viewModel, isLastCell: isLast)
        return cell
    }
    
    func makeDeadlineCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHDeadlineCell.reuseId
        ) as? ITCHDeadlineCell else {
            return UITableViewCell()
        }
        
        let model = deadlines[indexPath.row]
        let viewModel = ITCHDeadlineViewModel(
            course: model.course,
            text: model.text,
            deadline: model.deadline,
            isChecked: model.isChecked
        )
        
        cell.configure(with: viewModel, isLastCell: indexPath.row == deadlines.count - 1)
        return cell
    }
}
