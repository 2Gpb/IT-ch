//
//  ITCHHelpQuestionsInteractor.swift
//  ITCHAuthorization
//
//  Created by Peter on 19.04.2025.
//

import UIKit
import ITCHUIComponents

final class ITCHHelpQuestionsInteractor: NSObject, ITCHHelpQuestionsBusinessLogic, ITCHHelpQuestionsStorage {
    // MARK: - Private fields
    private let presenter: ITCHHelpQuestionsPresentationLogic & ITCHHelpQuestionsRouterLogic
    
    // MARK: - Variables
    var helpQuestions: [ITCHHelpQuestionModel] = [
        ITCHHelpQuestionModel(
            question: "Кто может войти в приложение?",
            answer: "Приложением могут пользоваться зачисленные студенты бакалавриата, магистратуры и аспирантуры, преподаватели и сотрудники НИУ ВШЭ. Если вы абитуриент или лицеист, войти в приложение не получится."
        ),
        ITCHHelpQuestionModel(
            question: "Как войти в приложение?",
            answer: "Для авторизации используйте свою корпоративную электронную почту (вида xxx@edu.hse.ru или yyy@hse.ru) и парольот нее. Это те же самые логин и пароль, которые используются для входа в LMS, SmartLMS и ЕЛК. Войти под личной почтой не получится."
        ),
        ITCHHelpQuestionModel(
            question: "Где я могу получить корпоративную электронную почту?",
            answer: "Созданием и отправкой информации о корпоративных электронных адресах занимаются сотрудники учебных офисов ваших образовательных программ. Более подробную информацию можно узнать по ссылке: https://www.hse.ru/studyspravka/corpemail/"
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHHelpQuestionCell.reuseId
        ) as? ITCHHelpQuestionCell else {
            return UITableViewCell()
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
