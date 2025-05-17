//
//  ITCHMembersViewController.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHUtilities

final class ITCHMembersViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title: String = "Участники"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
            static let rightImage: UIImage = ITCHImage.plus24.image
        }
        
        enum MembersTable {
            static let backgroundColor: UIColor = .clear
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let topInset: CGFloat = 8
            static let bottomInset: CGFloat = 20
        }
        
        enum RoleAlert {
            static let title: String = "Смена роли"
            static let message: String = "Какую роль присвоить?"
            
            static let student: String = "Студент"
            static let assistant: String = "Ассистент"
            static let teacher: String = "Преподаватель"
            static let cancel: String = "Отменить"
            
            static let actionColor: UIColor = ITCHColor.blue70.color
            static let cancelColor: UIColor = ITCHColor.red60.color
            static let key: String = "titleTextColor"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHMembersBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let membersTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHMembersBusinessLogic) {
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
    
    // MARK: - Methods
    func displayRoleChangeAlert() {
        let alert = UIAlertController(
            title: Constant.RoleAlert.title,
            message: Constant.RoleAlert.message,
            preferredStyle: .actionSheet
        )
        
        let studentAction = UIAlertAction(title: Constant.RoleAlert.student, style: .default) { _ in }
        let assistantAction = UIAlertAction(title: Constant.RoleAlert.assistant, style: .default) { _ in }
        let teacherAction = UIAlertAction(title: Constant.RoleAlert.teacher, style: .default) { _ in }

        [studentAction, assistantAction, teacherAction].forEach { action in
            action.setValue(Constant.RoleAlert.actionColor, forKey: Constant.RoleAlert.key)
            alert.addAction(action)
        }

        let cancel = UIAlertAction(title: Constant.RoleAlert.cancel, style: .cancel)
        cancel.setValue(Constant.RoleAlert.cancelColor, forKey: Constant.RoleAlert.key)
        alert.addAction(cancel)

        present(alert, animated: true)
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setUpMembersTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                title: Constant.NavigationBar.title,
                leftImage: Constant.NavigationBar.leftImage,
                rightImage: Constant.NavigationBar.rightImage
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.rightAction = { [weak self] in
            self?.interactor.loadAddMembers()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpMembersTableView() {
        membersTableView.delegate = self
        membersTableView.dataSource = interactor
        membersTableView.backgroundColor = Constant.MembersTable.backgroundColor
        membersTableView.separatorStyle = Constant.MembersTable.separatorStyle
        membersTableView.showsVerticalScrollIndicator = false
        membersTableView.contentInset.top = Constant.MembersTable.topInset
        membersTableView.contentInset.bottom = Constant.MembersTable.bottomInset
        membersTableView.register(ITCHMemberCell.self, forCellReuseIdentifier: ITCHMemberCell.reuseId)
        
        view.addSubview(membersTableView)
        membersTableView.pinTop(to: navigationBar.bottomAnchor)
        membersTableView.pinHorizontal(to: view)
        membersTableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
}

// MARK: - UITableViewDelegate
extension ITCHMembersViewController: UITableViewDelegate { }
