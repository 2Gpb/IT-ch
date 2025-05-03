//
//  ITCHAboutAppViewController.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHAboutAppViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let backgroundColor: UIColor = ITCHColor.backgroundGray.color
        }
        
        enum NavigationBar {
            static let title = "О приложении"
            static let leftImage: UIImage = ITCHImage.chevronLeft24.image
        }
        
        enum Logo {
            static let image: UIImage = ITCHImage.primaryLogo100.image
            static let topOffset: CGFloat = 20
        }
        
        enum AboutInfoTable {
            static let separatorStyle: UITableViewCell.SeparatorStyle = .none
            static let backgroundColor: UIColor = .clear
            static let isScrollEnabled: Bool = false
            static let topOffset: CGFloat = 26
            static let rowHeight: CGFloat = 44
        }
    }
    
    // MARK: - Private fields
    private let interactor: ITCHAboutAppBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let logoImageView: UIImageView = UIImageView()
    private let aboutInfoTableView: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: ITCHAboutAppBusinessLogic) {
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
        setUpLogoImageView()
        setUpAboutAppTableView()
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
    
    private func setUpLogoImageView() {
        logoImageView.image = Constant.Logo.image
        
        view.addSubview(logoImageView)
        logoImageView.pinTop(to: navigationBar.bottomAnchor, Constant.Logo.topOffset)
        logoImageView.pinCenterX(to: view)
    }
    
    private func setUpAboutAppTableView() {
        aboutInfoTableView.delegate = self
        aboutInfoTableView.dataSource = interactor
        aboutInfoTableView.separatorStyle = Constant.AboutInfoTable.separatorStyle
        aboutInfoTableView.isScrollEnabled = Constant.AboutInfoTable.isScrollEnabled
        aboutInfoTableView.backgroundColor = Constant.AboutInfoTable.backgroundColor
        aboutInfoTableView.register(ITCHAboutAppCell.self, forCellReuseIdentifier: ITCHAboutAppCell.reuseId)
        
        view.addSubview(aboutInfoTableView)
        aboutInfoTableView.pinTop(to: logoImageView.bottomAnchor, Constant.AboutInfoTable.topOffset)
        aboutInfoTableView.pinHorizontal(to: view)
        aboutInfoTableView.pinBottom(to: view)
    }
}

extension ITCHAboutAppViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.loadPage(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.AboutInfoTable.rowHeight
    }
}
