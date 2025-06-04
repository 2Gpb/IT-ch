//
//  ITCHProfileViewController.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHProfileViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title = "Профиль"
        }
        
        enum Account {
            static let wrapViewColor: UIColor = ITCHColor.backgroundGray.color
            static let wrapViewCornerRadius: CGFloat = 12
            static let wrapViewTopOffset: CGFloat = 20
            static let wrapViewHorizontalOffset: CGFloat = 16
            static let horizontalOffset: CGFloat = 16
            static let verticalOffset: CGFloat = 12
        }
        
        enum SettingsTable {
            static let backgroundColor: UIColor = .clear
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let showsVerticalScrollIndicator: Bool = false
            static let isScrollEnabled: Bool = true
            static let headerHeight: CGFloat = 52
            static let footerHeight: CGFloat = 16
            static let rowHeight: CGFloat = 44
            static let bottomInset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHProfileBusinessLogic
    private var settingsSections: [ITCHSettingsSection] = ITCHSettingsConfig.sections
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let accountWrapView: UIView = UIView()
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .defaultAccount)
    private let settingsTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHProfileBusinessLogic) {
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
        interactor.loadStart()
    }
    
    // MARK: - Methods
    func dispayStart(with model: ITCHAccountModel) {
        settingsSections[0].accountModel = model
        settingsTableView.reloadData()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundDark.color
        navigationController?.navigationBar.isHidden = true
        
        setUpNavigationBar()
        setUpSettingsTableView()
        view.bringSubviewToFront(navigationBar)
        navigationBar.backgroundColor = ITCHColor.backgroundDark.color
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(with: ITCHNavigationBarModel(title: Constant.NavigationBar.title))
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpSettingsTableView() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.backgroundColor = Constant.SettingsTable.backgroundColor
        settingsTableView.separatorStyle = Constant.SettingsTable.separatorStyle
        settingsTableView.showsVerticalScrollIndicator = Constant.SettingsTable.showsVerticalScrollIndicator
        settingsTableView.isScrollEnabled = Constant.SettingsTable.isScrollEnabled
        settingsTableView.contentInset.bottom = Constant.SettingsTable.bottomInset
        settingsTableView.register(ITCHSettingsCell.self, forCellReuseIdentifier: ITCHSettingsCell.reuseId)
        settingsTableView.register(ITCHAccountCell.self, forCellReuseIdentifier: ITCHAccountCell.reuseId)
        settingsTableView.register(ITCHSettingsHeaderCell.self, forCellReuseIdentifier: ITCHSettingsHeaderCell.reuseId)
        settingsTableView.register(ITCHSettingsFooterCell.self, forCellReuseIdentifier: ITCHSettingsFooterCell.reuseId)
        
        view.addSubview(settingsTableView)
        settingsTableView.pinTop(to: navigationBar.bottomAnchor)
        settingsTableView.pinHorizontal(to: view)
        settingsTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section != 0 else { return }
        let row = settingsSections[indexPath.section].rows?[indexPath.row]
        
        guard case let .setting(model) = row, let action = model.action else { return }
        
        switch action {
        case .appearance:
            interactor.loadAppearance()
        case .language:
            interactor.loadLanguage()
        case .about:
            interactor.loadAboutApp()
        case .contacts:
            interactor.loadContacts()
        case .exit:
            interactor.loadExit()
        }
    }
}

// MARK: - UITableViewDataSource
extension ITCHProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if settingsSections[section].accountModel != nil {
            return 1
        } else {
            return settingsSections[section].rows?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = settingsSections[indexPath.section]
        
        if let account = section.accountModel {
            return makeAccountCell(tableView, indexPath: indexPath, account: account)
        }
        
        guard let row = section.rows?[indexPath.row] else {
            return UITableViewCell()
        }
        
        switch row {
        case .header(let title):
            return makeHeaderCell(tableView, indexPath: indexPath, title: title)
        case .footer:
            return makeFooterCell(tableView, indexPath: indexPath)
        case .setting(let model):
            return makeSettingCell(tableView, indexPath: indexPath, model: model)
        }
    }
}

// MARK: - Configure cells 
extension ITCHProfileViewController {
    func makeAccountCell(
        _ tableView: UITableView,
        indexPath: IndexPath,
        account: ITCHAccountModel
    ) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHAccountCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHAccountCell else {
            return rawCell
        }
        
        cell.configure(
            with: ITCHAccountViewModel(
                image: account.image,
                name: account.name,
                info: account.info
            )
        )
        return cell
    }
    
    func makeHeaderCell(_ tableView: UITableView, indexPath: IndexPath, title: String) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHSettingsHeaderCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHSettingsHeaderCell else {
            return rawCell
        }
        
        cell.configure(with: title)
        return cell
    }
    
    func makeFooterCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHSettingsFooterCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHSettingsFooterCell else {
            return rawCell
        }
        
        return cell
    }
    
    func makeSettingCell(
        _ tableView: UITableView,
        indexPath: IndexPath,
        model: ITCHSettingsModel
    ) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHSettingsCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHSettingsCell else {
            return rawCell
        }
        
        let viewModel = ITCHSettingsRowViewModel(
            leftImage: model.image,
            title: model.title,
            subtitle: model.subtitle,
            type: model.type
        )
        
        switch model.type {
        case .toggle:
            cell.configure(with: viewModel) { isOn in
                print("Toggle changed to", isOn)
            }
        default:
            cell.configure(with: viewModel)
        }
        
        return cell
    }
}
