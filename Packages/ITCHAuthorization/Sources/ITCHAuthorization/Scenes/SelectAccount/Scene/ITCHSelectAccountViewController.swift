//
//  ITCHSelectAccountViewController.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHSelectAccountViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSelectAccountBusinessLogic & ITCHAccountsStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .image)
    private let titleLabel: UILabel = UILabel()
    private let accountsTableView: UITableView = UITableView()
    private let manageAccountsButton: ITCHButton = ITCHButton(title: "Управление аккаунтами", type: .secondary)
    private let contentStack: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHSelectAccountBusinessLogic & ITCHAccountsStorage) {
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
        setUpTitleLabel()
        setUpAccountsCollectionView()
        setUpManageAccountsButton()
        setUpContentStack()
    }
    
    private func setUpView() {
        view.backgroundColor = ITCHColor.backgroundGray.color
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(
            with: ITCHNavigationBarModel(
                leftImage: ITCHImage.chevronLeft24.image,
                rightImage: ITCHImage.info24.image
            )
        )
        
        navigationBar.leftAction = { [weak self] in
            self?.interactor.loadDismiss()
        }
        navigationBar.rightAction = { }
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpTitleLabel() {
        titleLabel.text = "Выбери аккаунт"
        titleLabel.font = ITCHFont.header4.font
        titleLabel.textColor = ITCHColor.base0.color
    }
    
    private func setUpAccountsCollectionView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = interactor
        accountsTableView.separatorStyle = .none
        accountsTableView.isScrollEnabled = false
        accountsTableView.backgroundColor = .clear
        accountsTableView.register(
            ITCHAccountCell.self,
            forCellReuseIdentifier: ITCHAccountCell.reuseId
        )
        
        accountsTableView.setWidth(view.frame.width - 32.0)
        accountsTableView.setHeight(Double(interactor.accounts.count * 58))
    }
    
    private func setUpManageAccountsButton() {
        manageAccountsButton.action = { }
        manageAccountsButton.setWidth(210)
    }
    
    private func setUpContentStack() {
        contentStack.axis = .vertical
        contentStack.spacing = 44
        contentStack.alignment = .center
        
        [titleLabel, accountsTableView, manageAccountsButton].forEach { element in
            contentStack.addArrangedSubview(element)
        }
        
        view.addSubview(contentStack)
        contentStack.pinCenter(to: view)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ITCHSelectAccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
