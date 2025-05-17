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
            static let isScrollEnabled: Bool = false
            static let headerHeight: CGFloat = 52
            static let footerHeight: CGFloat = 16
            static let rowHeight: CGFloat = 44
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
        accountRow.configure(
            with: ITCHAccountViewModel(
                image: model.image,
                name: model.name,
                info: model.info
            )
        )
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundDark.color
        navigationController?.navigationBar.isHidden = true
        
        setUpNavigationBar()
        setUpUserProfileWrapView()
        setUpAccountRow()
        setUpSettingsTableView()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(with: ITCHNavigationBarModel(title: Constant.NavigationBar.title))
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpUserProfileWrapView() {
        accountWrapView.backgroundColor = Constant.Account.wrapViewColor
        accountWrapView.layer.cornerRadius = Constant.Account.wrapViewCornerRadius
        
        view.addSubview(accountWrapView)
        accountWrapView.pinTop(to: navigationBar.bottomAnchor, Constant.Account.wrapViewTopOffset)
        accountWrapView.pinHorizontal(to: view, Constant.Account.wrapViewHorizontalOffset)
    }
    
    private func setUpAccountRow() {
        accountWrapView.addSubview(accountRow)
        accountRow.pinHorizontal(to: accountWrapView, Constant.Account.horizontalOffset)
        accountRow.pinVertical(to: accountWrapView, Constant.Account.verticalOffset)
    }
    
    private func setUpSettingsTableView() {
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.backgroundColor = Constant.SettingsTable.backgroundColor
        settingsTableView.separatorStyle = Constant.SettingsTable.separatorStyle
        settingsTableView.showsVerticalScrollIndicator = Constant.SettingsTable.showsVerticalScrollIndicator
        settingsTableView.isScrollEnabled = Constant.SettingsTable.isScrollEnabled
        settingsTableView.register(ITCHSettingsCell.self, forCellReuseIdentifier: ITCHSettingsCell.reuseId)
        
        view.addSubview(settingsTableView)
        settingsTableView.pinTop(to: accountWrapView.bottomAnchor)
        settingsTableView.pinHorizontal(to: view)
        settingsTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = settingsSections[indexPath.section].settings[indexPath.row]
        
        guard let action = model.action else { return }
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ITCHSettingsHeaderView(with: settingsSections[section].title)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        ITCHSettingsFooterView()
    }
}

// MARK: - UITableViewDataSource
extension ITCHProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsSections[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        settingsSections[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHSettingsCell.reuseId
        ) as? ITCHSettingsCell else {
            return UITableViewCell()
        }
        
        let model = settingsSections[indexPath.section].settings[indexPath.row]
        let viewModel = ITCHSettingsRowViewModel(
            leftImage: model.image,
            title: model.title,
            subtitle: model.subtitle,
            type: model.type
        )
        
        switch model.type {
        case .toggle:
            cell.configure(with: viewModel) { [weak self] isOn in
                print(isOn ? "ON" : "OFF")
                self?.settingsSections[indexPath.section].settings[indexPath.row].type = .toggle(isOn: isOn)
            }
        default:
            cell.configure(with: viewModel)
        }
        
        return cell
    }
}
