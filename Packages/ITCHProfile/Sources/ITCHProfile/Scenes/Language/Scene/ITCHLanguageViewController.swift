//
//  ITCHLanguageViewController.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHLanguageViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum NavigationBar {
            static let title = "Язык приложения"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum LanguagesTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let topOffset: CGFloat = 20
            static let rowHeight: CGFloat = 44
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHLanguageBusinessLogic & ITCHLanguageStorage
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let languagesTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHLanguageBusinessLogic & ITCHLanguageStorage) {
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
        setUpLanguagesTableView()
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
    
    private func setUpLanguagesTableView() {
        languagesTableView.delegate = self
        languagesTableView.dataSource = interactor
        languagesTableView.separatorStyle = Constant.LanguagesTable.separatorStyle
        languagesTableView.backgroundColor = Constant.LanguagesTable.backgroundColor
        languagesTableView.register(ITCHLanguageCell.self, forCellReuseIdentifier: ITCHLanguageCell.reuseId)
        
        view.addSubview(languagesTableView)
        languagesTableView.pinTop(to: navigationBar.bottomAnchor, Constant.LanguagesTable.topOffset)
        languagesTableView.pinHorizontal(to: view)
        languagesTableView.pinBottom(to: view)
    }
}

// MARK: - UITableViewDelegate
extension ITCHLanguageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.LanguagesTable.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let previous = interactor.currentLanguageIndex
        interactor.currentLanguageIndex = indexPath

        if let cell = tableView.cellForRow(at: previous) as? ITCHLanguageCell {
            cell.isCheck = false
        }
        
        if let cell = tableView.cellForRow(at: indexPath) as? ITCHLanguageCell {
            cell.isCheck = true
        }
        
        interactor.loadChangeLanguage(with: indexPath.row)
    }
}
