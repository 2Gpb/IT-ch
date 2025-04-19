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
        
        enum NavigationBar {
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
            static let rightImage: UIImage = ITCHImage.info24.image
        }
        
        enum Title {
            static let text = "Выбери аккаунт"
            static let font: UIFont = ITCHFont.header4.font
            static let textColor: UIColor = ITCHColor.base0.color
        }
        
        enum AccountsCollection {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = false
            static let horizontalOffset: CGFloat = 32
            static let heightForRow: CGFloat = 58
        }
        
        enum ManageAccountsButton {
            static let title: String = "Управление аккаунтами"
            static let width: CGFloat = 210
        }
        
        enum ContentStack {
            static let axis: NSLayoutConstraint.Axis = .vertical
            static let spacing: CGFloat = 44
            static let alignment: UIStackView.Alignment = .center
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHSelectAccountBusinessLogic & ITCHAccountsStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .image)
    private let titleLabel: UILabel = UILabel()
    private let accountsTableView: UITableView = UITableView()
    private let manageAccountsButton: ITCHButton = ITCHButton(
        title: Constant.ManageAccountsButton.title,
        type: .secondary
    )
    
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
                leftImage: Constant.NavigationBar.leftImage,
                rightImage: Constant.NavigationBar.rightImage
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
        titleLabel.text = Constant.Title.text
        titleLabel.font = Constant.Title.font
        titleLabel.textColor = Constant.Title.textColor
    }
    
    private func setUpAccountsCollectionView() {
        accountsTableView.delegate = self
        accountsTableView.dataSource = interactor
        accountsTableView.separatorStyle = Constant.AccountsCollection.separatorStyle
        accountsTableView.isScrollEnabled = Constant.AccountsCollection.isScrollEnabled
        accountsTableView.backgroundColor = Constant.AccountsCollection.backgroundColor
        accountsTableView.register(ITCHAccountCell.self, forCellReuseIdentifier: ITCHAccountCell.reuseId)
        
        accountsTableView.setWidth(view.frame.width - Constant.AccountsCollection.horizontalOffset)
        accountsTableView.setHeight(CGFloat(interactor.accounts.count) * Constant.AccountsCollection.heightForRow +
                                    Constant.AccountsCollection.heightForRow)
    }
    
    private func setUpManageAccountsButton() {
        manageAccountsButton.action = { }
        manageAccountsButton.setWidth(Constant.ManageAccountsButton.width)
    }
    
    private func setUpContentStack() {
        contentStack.axis = Constant.ContentStack.axis
        contentStack.spacing = Constant.ContentStack.spacing
        contentStack.alignment = Constant.ContentStack.alignment
        
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
        return Constant.AccountsCollection.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
