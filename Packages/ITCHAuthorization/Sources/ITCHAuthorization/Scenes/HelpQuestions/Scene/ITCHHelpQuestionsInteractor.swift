//
//  ITCHHelpQuestionsInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHelpQuestionsInteractor: NSObject, ITCHHelpQuestionsBusinessLogic, ITCHHelpQuestionsStorage {
    // MARK: - Constants
    private enum Constant {
        enum Questions {
            static let firstQuestion: String = "Кто может войти в приложение?"
            static let secondQuestion: String = "Как войти в приложение?"
            static let thirdQuestion: String = "Где я могу получить корпоративную электронную почту?"
        }
        
        enum Answers {
            static let firstAnswer: String = "Приложением могут пользоваться зачисленные студенты бакалавриата, магистратуры и аспирантуры, преподаватели и сотрудники НИУ ВШЭ. Если вы абитуриент или лицеист, войти в приложение не получится."
            static let secondAnswer: String = "Для авторизации используйте свою корпоративную электронную почту (вида xxx@edu.hse.ru или yyy@hse.ru) и парольот нее. Это те же самые логин и пароль, которые используются для входа в LMS, SmartLMS и ЕЛК. Войти под личной почтой не получится."
            static let thirdAnswer: String = "Созданием и отправкой информации о корпоративных электронных адресах занимаются сотрудники учебных офисов ваших образовательных программ. Более подробную информацию можно узнать по ссылке: https://www.hse.ru/studyspravka/corpemail/"
        }
    }
    
    // MARK: - Private fields
    private let presenter: ITCHHelpQuestionsPresentationLogic & ITCHHelpQuestionsRouterLogic
    
    // MARK: - Variables
    var helpQuestions: [ITCHHelpQuestionModel] = [
        ITCHHelpQuestionModel(
            question: Constant.Questions.firstQuestion,
            answer: Constant.Answers.firstAnswer
        ),
        ITCHHelpQuestionModel(
            question: Constant.Questions.secondQuestion,
            answer: Constant.Answers.secondAnswer
        ),
        ITCHHelpQuestionModel(
            question: Constant.Questions.thirdQuestion,
            answer: Constant.Answers.thirdAnswer
        )
    ]
    
    // MARK: - Lifecycle
    init(presenter: ITCHHelpQuestionsPresentationLogic & ITCHHelpQuestionsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
}

// MARK: - UITableViewDataSource
extension ITCHHelpQuestionsInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        helpQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHHelpQuestionCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHHelpQuestionCell else {
            return rawCell
        }
        
        cell.configure(
            with: ITCHHelpQuestionViewModel(
                question: helpQuestions[indexPath.row].question,
                answer: helpQuestions[indexPath.row].answer
            )
        )
        
        return cell
    }
}
