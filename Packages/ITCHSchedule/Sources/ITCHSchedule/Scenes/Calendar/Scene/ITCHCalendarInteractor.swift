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
    
    var scheduleSections: [ScheduleSection] = [
        ScheduleSection(
            date: Date(),
            items: [
                ITCHScheduleModel(
                    courseName: "НИС “Основы iOS разработки на UIKit”",
                    location: "N506, Покровский б-р, д. 11",
                    timeInterval: "18:10 - 19:30"
                )
            ]
        ),
        ScheduleSection(
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
        ScheduleSection(
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

// MARK: - UICollectionViewDataSource
extension ITCHCalendarInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deadlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHDeadlineCell.reuseId
        ) as? ITCHDeadlineCell else {
            return UITableViewCell()
        }
        
        cell.configure(
            with: ITCHDeadlineViewModel(
                course: deadlines[indexPath.row].course,
                text: deadlines[indexPath.row].text,
                deadline: deadlines[indexPath.row].deadline,
                isChecked: deadlines[indexPath.row].isChecked
            ), isLastCell: indexPath.row == deadlines.count - 1 
        )
        
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension ITCHCalendarInteractor: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        scheduleSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        scheduleSections[section].items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ITCHScheduleCell.reuseId,
            for: indexPath
        ) as? ITCHScheduleCell else {
            return UICollectionViewCell()
        }
        
        let isLast = indexPath.item == scheduleSections[indexPath.section].items.count - 1
        let model = scheduleSections[indexPath.section].items[indexPath.item]
        let viewModel = ITCHScheduleViewModel(
            courseName: model.courseName,
            location: model.location,
            timeInterval: model.timeInterval
        )
        
        cell.configure(
            with: viewModel,
            isLastCell: isLast
        )
        
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ITCHScheduleHeaderView.reuseId,
                for: indexPath
              ) as? ITCHScheduleHeaderView else {
            return UICollectionReusableView()
        }
        
        header.configure(with: scheduleSections[indexPath.section].date)
        return header
    }
}
