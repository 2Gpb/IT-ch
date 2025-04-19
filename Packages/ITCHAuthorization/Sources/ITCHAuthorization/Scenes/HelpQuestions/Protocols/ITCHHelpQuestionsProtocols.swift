//
//  ITCHHelpQuestionsProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit

@MainActor
protocol ITCHHelpQuestionsBusinessLogic: UITableViewDataSource {
    func loadDismiss()
}

protocol ITCHHelpQuestionsPresentationLogic { }

@MainActor
protocol ITCHHelpQuestionsRouterLogic {
    func popViewController()
}

@MainActor
protocol ITCHHelpQuestionsStorage {
    var helpQuestions: [ITCHHelpQuestionModel] { get }
}
