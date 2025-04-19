//
//  ITCHHelpQuestionsInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

final class ITCHHelpQuestionsInteractor: ITCHHelpQuestionsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHelpQuestionsPresentationLogic & ITCHHelpQuestionsRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: ITCHHelpQuestionsPresentationLogic & ITCHHelpQuestionsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}
