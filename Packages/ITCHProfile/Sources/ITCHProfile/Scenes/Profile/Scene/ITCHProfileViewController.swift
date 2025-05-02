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
    }
    
    // MARK: - Private fields
    private let interactor: ITCHProfileBusinessLogic
    
    // MARK: - UI Components
    private let navigationBar: ITCHNavigationBar = ITCHNavigationBar(type: .title)
    private let userProfileWrapView: UIView = UIView()
    private let accountRow: ITCHAccountRow = ITCHAccountRow(type: .defaultAccount)
    
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
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ITCHColor.backgroundDark.color
        navigationController?.navigationBar.isHidden = true
        
        setUpNavigationBar()
        setUpUserProfileWrapView()
        setUpAccountRow()
    }
    
    private func setUpNavigationBar() {
        navigationBar.configure(with: ITCHNavigationBarModel(title: "Профиль"))
        
        view.addSubview(navigationBar)
        navigationBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navigationBar.pinHorizontal(to: view)
    }
    
    private func setUpUserProfileWrapView() {
        userProfileWrapView.backgroundColor = ITCHColor.backgroundGray.color
        userProfileWrapView.layer.cornerRadius = 12
        
        view.addSubview(userProfileWrapView)
        userProfileWrapView.pinTop(to: navigationBar.bottomAnchor, 20)
        userProfileWrapView.pinHorizontal(to: view, 16)
    }
    
    private func setUpAccountRow() {
        accountRow.configure(with: ITCHAccountViewModel(name: "Тюхменев Петр Вячеславович", info: "Студент"))
        
        userProfileWrapView.addSubview(accountRow)
        accountRow.pinHorizontal(to: userProfileWrapView, 16)
        accountRow.pinVertical(to: userProfileWrapView, 12)
    }
}
