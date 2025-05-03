//
//  ITCHAboutAppPresenter.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHAboutAppPresenter: ITCHAboutAppPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHAboutAppViewController?
}

// MARK: - RouterLogic
extension ITCHAboutAppPresenter: ITCHAboutAppRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func routeToFAQ() {
        view?.navigationController?.pushViewController(
            ITCHInfoAssembly.build(
                with: ITCHInfoModel(
                    title: ITCHFAQModel.title,
                    body: ITCHFAQModel.text
                )
            ),
            animated: true
        )
    }
    
    func routeToPrivacyPolicy() {
        view?.navigationController?.pushViewController(
            ITCHInfoAssembly.build(
                with: ITCHInfoModel(
                    title: ITCHPrivacyModel.title,
                    body: ITCHPrivacyModel.text
                )
            ),
            animated: true
        )
    }
    
    func routeToEvaluateApp() { }
}
