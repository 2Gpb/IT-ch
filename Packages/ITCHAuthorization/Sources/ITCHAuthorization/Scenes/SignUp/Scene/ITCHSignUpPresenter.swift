//
//  ITCHSignUpPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import SwiftUI

final class ITCHSignUpPresenter: ITCHSignUpPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHSignUpViewController?
}

// MARK: - RouterLogic
extension ITCHSignUpPresenter: ITCHSignUpRouterLogic {
    func routeToInfo() {
        view?.navigationController?.pushViewController(ITCHHelpQuestionsAssembly.build(), animated: true)
    }
    
    func routeToCode() {
        let viewModel: ITCHEnterCodeViewModel = ITCHEnterCodeViewModel(onNext: { [weak self] in
            let nextVC = ITCHSignUpPasswordAssembly.build()
            self?.view?.navigationController?.pushViewController(nextVC, animated: true)
        })
                                                                       
        let enterCodeView = ITCHEnterCodeView(viewModel: viewModel)
        
        let enterCodeHosting = UIHostingController(rootView: enterCodeView)
        view?.navigationController?.pushViewController(enterCodeHosting, animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
