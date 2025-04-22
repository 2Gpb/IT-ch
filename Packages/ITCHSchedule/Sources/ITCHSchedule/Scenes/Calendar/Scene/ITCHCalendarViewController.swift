//
//  ITCHCalendarViewController.swift
//  ITCHSchedule
//
//  Created by Peter on 21.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHCalendarViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let calendarBackgroundColor: UIColor = ITCHColor.backgroundDark.color
            static let deadlineBackgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum Segmented {
            @MainActor
            static let titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: ITCHColor.base0.color,
                NSAttributedString.Key.font: ITCHFont.bodySMedium.font
            ]
            
            static let items: [String] = ["Календарь", "Дедлайны"]
            static let selectedIndex: Int = 0
            static let selectedColor: UIColor = ITCHColor.base60.color
            static let backgroundColor: UIColor = ITCHColor.cellGray.color
            static let topOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 16
        }
        
        enum EmptyState {
            static let horizontalOffset: CGFloat = 16
            static let calendarTitle: String = "У вас пока нет расписания"
            static let deadlinesTitle: String = "У вас пока нет дедлайнов"
            static let calendarSubtitle: String = "Оно появится, как только вы\nполучите доступ к курсу."
            static let deadlinesSubtitle: String = "Они станут доступны, как только\nв курсе появится задание."
        }
        
        enum Deadlines {
            static let topOffset: CGFloat = 28
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHCalendarBusinessLogic & ITCHDeadlinesStorage
    
    // MARK: - UI Components
    private let segmentedControl: UISegmentedControl = UISegmentedControl(items: Constant.Segmented.items)
    private let emptyStateView: ITCHEmptyStateView = ITCHEmptyStateView()
    private let deadlinesTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHCalendarBusinessLogic & ITCHDeadlinesStorage) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpView()
        setUpSegmentedControl()
        setUpEmptyStateView()
        setUpDeadlinesTable()
    }
    
    private func setUpView() {
        view.backgroundColor = Constant.View.calendarBackgroundColor
    }
    
    private func setUpSegmentedControl() {
        segmentedControl.setTitleTextAttributes(Constant.Segmented.titleTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(Constant.Segmented.titleTextAttributes, for: .selected)
        segmentedControl.selectedSegmentIndex = Constant.Segmented.selectedIndex
        segmentedControl.selectedSegmentTintColor = Constant.Segmented.selectedColor
        segmentedControl.backgroundColor = Constant.Segmented.backgroundColor
        segmentedControl.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        segmentedControl.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.Segmented.topOffset)
        segmentedControl.pinHorizontal(to: view, Constant.Segmented.horizontalOffset)
    }
    
    private func setUpEmptyStateView() {
        emptyStateView.configure(title: Constant.EmptyState.calendarTitle, subtitle: Constant.EmptyState.calendarSubtitle)
        
        view.addSubview(emptyStateView)
        emptyStateView.pinCenterY(to: view)
        emptyStateView.pinHorizontal(to: view, Constant.EmptyState.horizontalOffset)
    }
    
    private func setUpDeadlinesTable() {
        deadlinesTableView.delegate = self
        deadlinesTableView.dataSource = interactor
        deadlinesTableView.separatorStyle = .none
        deadlinesTableView.backgroundColor = .clear
        deadlinesTableView.isHidden = true
        deadlinesTableView.register(ITCHDeadlineCell.self, forCellReuseIdentifier: ITCHDeadlineCell.reuseId)
        
        view.addSubview(deadlinesTableView)
        deadlinesTableView.pinTop(to: segmentedControl.bottomAnchor, Constant.Deadlines.topOffset)
        deadlinesTableView.pinHorizontal(to: view)
        deadlinesTableView.pinBottom(to: view)
    }
    
    // MARK: - Actions
    @objc
    private func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = Constant.View.calendarBackgroundColor
            deadlinesTableView.isHidden = true
            emptyStateView.isHidden = false
            emptyStateView.configure(
                title: Constant.EmptyState.calendarTitle,
                subtitle: Constant.EmptyState.calendarSubtitle
            )
        default:
            view.backgroundColor = Constant.View.deadlineBackgroundColor
            deadlinesTableView.isHidden = false
            emptyStateView.isHidden = !interactor.deadlines.isEmpty
            emptyStateView.configure(
                title: Constant.EmptyState.deadlinesTitle,
                subtitle: Constant.EmptyState.deadlinesSubtitle
            )
        }
    }
}

// MARK: - UITableViewDelegate
extension ITCHCalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as? ITCHDeadlineCell
        cell?.isCheck.toggle()
    }
}
