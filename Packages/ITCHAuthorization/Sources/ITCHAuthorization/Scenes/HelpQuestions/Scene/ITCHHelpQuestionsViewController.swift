//
//  ITCHHelpQuestionsViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHelpQuestionsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title: String = "F.A.Q."
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum QuestionsTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = true
            static let heightForRow: CGFloat = 58
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHHelpQuestionsBusinessLogic & ITCHHelpQuestionsStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let questionsTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHHelpQuestionsBusinessLogic & ITCHHelpQuestionsStorage) {
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
        setUpNavigationBar()
        setUpQuestionsTableView()
    }
    
    private func setUpView() {
        view.backgroundColor = ITCHColor.backgroundGray.color
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpQuestionsTableView() {
        questionsTableView.dataSource = interactor
        questionsTableView.separatorStyle = Constant.QuestionsTable.separatorStyle
        questionsTableView.isScrollEnabled = Constant.QuestionsTable.isScrollEnabled
        questionsTableView.backgroundColor = Constant.QuestionsTable.backgroundColor
        questionsTableView.rowHeight = UITableView.automaticDimension
        questionsTableView.register(ITCHHelpQuestionCell.self, forCellReuseIdentifier: ITCHHelpQuestionCell.reuseId)
        
        view.addSubview(questionsTableView)
        questionsTableView.pinTop(to: navigationBar.bottomAnchor)
        questionsTableView.pinHorizontal(to: view)
        questionsTableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
