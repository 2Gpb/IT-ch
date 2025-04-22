//
//  ITCHCalendarInetactor.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCalendarInteractor: NSObject, ITCHCalendarBusinessLogic, ITCHDeadlinesStorage {
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
            ), isLastCell: deadlines.count == indexPath.row + 1
        )
        
        return cell
    }
}
