//
//  ITCHHelpQuestionsPresenter.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

final class ITCHHelpQuestionsPresenter: ITCHHelpQuestionsPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHelpQuestionsViewController?
}

// MARK: - RouterLogic
extension ITCHHelpQuestionsPresenter: ITCHHelpQuestionsRouterLogic {
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
