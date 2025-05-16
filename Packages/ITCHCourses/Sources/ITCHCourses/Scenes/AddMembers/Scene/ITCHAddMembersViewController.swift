//
//  ITCHAddMembersViewController.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHAddMembersViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title: String = "Добавить участников"
            static let topOffset: CGFloat = 14
        }
        
        enum SearchBar {
            static let font: UIFont = ITCHFont.navBarRegular.font
            static let textColor: UIColor = ITCHColor.base0.color
            static let topOffset: CGFloat = 4
            static let horizontalOffset: CGFloat = 7
            static let placeholder: String = "Поиск"
            static let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: ITCHColor.base30.color,
                .font: ITCHFont.navBarRegular.font
            ]
        }
        
        enum MembersTable {
            static let separationStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let topOffset: CGFloat = 4
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHAddMembersBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHPresentNavigationBar = ITCHPresentNavigationBar()
    private let searchBar = UISearchBar()
    private let membersTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHAddMembersBusinessLogic) {
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
        view.backgroundColor = ITCHColor.backgroundGray.color
        setUpNavigationBar()
        setupSearchBar()
        setUpMembersTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(with: Constant.NavigationBar.title)
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        navigationBar.rightAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.NavigationBar.topOffset)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setupSearchBar() {
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: Constant.SearchBar.placeholder,
            attributes: Constant.SearchBar.attributes
        )
        
        searchBar.searchTextField.font = Constant.SearchBar.font
        searchBar.searchTextField.textColor = Constant.SearchBar.textColor
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        searchBar.pinTop(to: navigationBar.bottomAnchor, Constant.SearchBar.topOffset)
        searchBar.pinHorizontal(to: view, Constant.SearchBar.horizontalOffset)
    }
    
    private func setUpMembersTableView() {
        membersTableView.backgroundColor = Constant.MembersTable.backgroundColor
        membersTableView.separatorStyle = Constant.MembersTable.separationStyle
        membersTableView.delegate = self
        membersTableView.dataSource = interactor
        membersTableView.register(ITCHMemberToAddCell.self, forCellReuseIdentifier: ITCHMemberToAddCell.reuseId)
        
        view.addSubview(membersTableView)
        membersTableView.pinTop(to: searchBar.bottomAnchor, Constant.MembersTable.topOffset)
        membersTableView.pinHorizontal(to: view)
        membersTableView.pinBottom(to: view)
    }
}

// MARK: - UISearchBarDelegate
extension ITCHAddMembersViewController: UISearchBarDelegate { }

// MARK: - UITableViewDelegate
extension ITCHAddMembersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? ITCHMemberToAddCell {
            cell.isSelected.toggle()
        }
    }
}
