//
//  ITCHHelpQuestionsProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

@MainActor
protocol ITCHHelpQuestionsBusinessLogic {
    func loadDismiss()
}

protocol ITCHHelpQuestionsPresentationLogic { }

@MainActor
protocol ITCHHelpQuestionsRouterLogic {
    func popViewController()
}
