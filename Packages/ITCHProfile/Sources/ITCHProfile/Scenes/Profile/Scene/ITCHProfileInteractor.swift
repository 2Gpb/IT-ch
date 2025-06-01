//
//  ITCHProfileInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import ITCHCore

final class ITCHProfileInteractor: ITCHProfileBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic
    private let secureSessionService: ITCHSecureSessionLogic
    private let userRoleService: ITCHUserRoleLogic
    private var account: ITCHAccountModel = ITCHAccountModel(name: "Тюхменев Петр Вячеславович", info: "Студент")
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic,
        userRoleService: ITCHUserRoleLogic,
        secureSessionService: ITCHSecureSessionLogic
    ) {
        self.presenter = presenter
        self.userRoleService = userRoleService
        self.secureSessionService = secureSessionService
    }
    
    // MARK: - Methods
    func loadStart() {
        guard let user = userRoleService.get() else { return }
        
        let role = user.role == .student ? "Студент" : "Преподаватель"
        presenter.presentStart(with: ITCHAccountModel(name: user.email, info: role))
    }
    
    func loadAppearance() {
        presenter.routeToAppearance()
    }
    
    func loadLanguage() {
        presenter.routeToLanguage()
    }
    
    func loadAboutApp() {
        presenter.routeToAboutApp()
    }
    
    func loadContacts() {
        presenter.routeToContacts()
    }
    
    func loadExit() {
        secureSessionService.clearTokens()
        userRoleService.clearRole()
        
        presenter.routeToLogOut()
    }
}
