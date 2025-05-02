//
//  ITCHManageAccountsViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHManageAccountsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
            static let cornerRadius: CGFloat = 12
            static let verticalOffsets: CGFloat = 44
        }
        
        enum AccountsTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = false
            static let heightForRow: CGFloat = 60
            static let topOffset: CGFloat = 28
            static let horizontalOffset: CGFloat = 16
            static let bottomOffset: CGFloat = 16
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHManageAccountsBusinessLogic & ITCHAccountsStorage
    
    // MARK: - UI Components
    private let accountsTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHManageAccountsBusinessLogic & ITCHAccountsStorage) {
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
        setUpAccountsTableView()
    }
    
    private func setUpView() {
        view.backgroundColor = Constant.View.backgroundColor
        
        if let sheet = sheetPresentationController {
            sheet.detents = [
                .custom(
                    resolver: { [weak self] _ in
                        guard let count = self?.interactor.accounts.count else {
                            return Constant.View.verticalOffsets
                        }

                        let contentHeight = CGFloat(count) * Constant.AccountsTable.heightForRow
                        return contentHeight + Constant.View.verticalOffsets
                    }
                )
            ]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = Constant.View.cornerRadius
        }
    }
    
    private func setUpAccountsTableView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = interactor
        accountsTableView.separatorStyle = Constant.AccountsTable.separatorStyle
        accountsTableView.isScrollEnabled = Constant.AccountsTable.isScrollEnabled
        accountsTableView.backgroundColor = Constant.AccountsTable.backgroundColor
        accountsTableView.register(ITCHManageAccountCell.self, forCellReuseIdentifier: ITCHManageAccountCell.reuseId)
        
        view.addSubview(accountsTableView)
        accountsTableView.pinTop(to: view, Constant.AccountsTable.topOffset)
        accountsTableView.pinHorizontal(to: view/*, Constant.AccountsTable.horizontalOffset*/)
        accountsTableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constant.AccountsTable.bottomOffset)
    }
}

// MARK: - UITableViewDelegate
extension ITCHManageAccountsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.AccountsTable.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
