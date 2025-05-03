//
//  ITCHProfileInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

final class ITCHProfileInteractor: ITCHProfileBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic
    private var account: ITCHAccountModel = ITCHAccountModel(name: "Тюхменев Петр Вячеславович", info: "Студент")
    
    // MARK: - Lifecycle
    init(presenter: ITCHProfilePresentationLogic & ITCHProfileRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: account)
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
    
    func loadExit() { }
}
