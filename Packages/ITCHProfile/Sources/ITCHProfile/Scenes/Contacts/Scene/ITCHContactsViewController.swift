//
//  ITCHContactsViewController.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHContactsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum NavigationBar {
            static let title = "Сообщить о проблеме"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum ContactsTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = false
            static let topOffset: CGFloat = 20
            static let rowHeight: CGFloat = 44
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHContactsBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let contactsTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHContactsBusinessLogic) {
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
        view.backgroundColor = Constant.View.backgroundColor
        setUpNavigationBar()
        setUpContactsTableView()
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
    
    private func setUpContactsTableView() {
        contactsTableView.dataSource = interactor
        contactsTableView.delegate = self
        contactsTableView.separatorStyle = Constant.ContactsTable.separatorStyle
        contactsTableView.backgroundColor = Constant.ContactsTable.backgroundColor
        contactsTableView.isScrollEnabled = Constant.ContactsTable.isScrollEnabled
        contactsTableView.register(ITCHContactsCell.self, forCellReuseIdentifier: ITCHContactsCell.reuseId)
        
        view.addSubview(contactsTableView)
        contactsTableView.pinTop(to: navigationBar.bottomAnchor, Constant.ContactsTable.topOffset)
        contactsTableView.pinHorizontal(to: view)
        contactsTableView.pinBottom(to: view.bottomAnchor)
    }
}

// MARK: - UITableViewDelegate
extension ITCHContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.loadSocial(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.ContactsTable.rowHeight
    }
}
