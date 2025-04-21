//
//  ITCHSelectAccountPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 17.04.2025.
//

final class ITCHSelectAccountPresenter: ITCHSelectAccountPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSelectAccountViewController?
}

// MARK: - RouterLogic
extension ITCHSelectAccountPresenter: ITCHSelectAccountRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToManageAccounts() {
        let bottomSheetVC = ITCHManageAccountsAssembly.build()
        
        bottomSheetVC.modalPresentationStyle = .pageSheet
        view?.present(bottomSheetVC, animated: true)
    }
    
    func routeToHelpQuestions() {
        view?.navigationController?.pushViewController(ITCHHelpQuestionsAssembly.build(), animated: true)
    }
    
    func routeToLogin() {
        view?.navigationController?.pushViewController(ITCHLoginAssembly.build(), animated: true)
    }
}
