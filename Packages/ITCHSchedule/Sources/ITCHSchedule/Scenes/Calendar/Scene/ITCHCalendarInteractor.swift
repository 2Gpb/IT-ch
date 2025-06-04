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
        ),
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
        ),
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
        ),
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
        ),
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
        ),
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
        switch tableView.tag {
        case 1:
            scheduleSections.count
        case 2:
            1
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            /// with header
            scheduleSections[section].items.count + 1
        case 2:
            deadlines.count
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            makeScheduleCell(for: tableView, at: indexPath)
        case 2:
            makeDeadlineCell(for: tableView, at: indexPath)
        default:
            UITableViewCell()
        }
    }
}

// MARK: - Cells configure
extension ITCHCalendarInteractor {
    func makeScheduleCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            makeScheduleHeaderCell(for: tableView, at: indexPath)
        } else {
            makeScheduleItemCell(for: tableView, at: indexPath)
        }
    }
    
    func makeScheduleHeaderCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHScheduleHeaderCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHScheduleHeaderCell else {
            return rawCell
        }
        
        let date = scheduleSections[indexPath.section].date
        cell.configure(with: date)
        return cell
    }
    
    func makeScheduleItemCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        /// without header
        let actualIndex = indexPath.row - 1
        let section = scheduleSections[indexPath.section]
        let model = section.items[actualIndex]
        let isLast = actualIndex == section.items.count - 1
        
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHScheduleCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHScheduleCell else {
            return rawCell
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
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHDeadlineCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHDeadlineCell else {
            return rawCell
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
