//
//  ITCHHelpQuestionsProtocols.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit

protocol ITCHHelpQuestionsBusinessLogic: UITableViewDataSource {
    func loadDismiss()
}

protocol ITCHHelpQuestionsPresentationLogic { }

protocol ITCHHelpQuestionsRouterLogic {
    func popViewController()
}

protocol ITCHHelpQuestionsStorage {
    var helpQuestions: [ITCHHelpQuestionModel] { get }
}
