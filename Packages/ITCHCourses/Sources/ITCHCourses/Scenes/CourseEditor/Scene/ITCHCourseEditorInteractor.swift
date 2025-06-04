//
//  ITCHCourseEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import Foundation
import ITCHCore
import ITCHNetworking

final class ITCHCourseEditorInteractor: ITCHCourseEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic
    private let id: Int
    private let networkService: ITCHCourseEditorWorker
    private let secureService: ITCHSecureSessionLogic
    
    // MARK: - Variables
    private var course: ITCHCourseEditorModel.Local.ITCHCourse?
    
    // MARK: - Lifecycle
    init(
        for id: Int,
        presenter: ITCHCourseEditorPresentationLogic & ITCHCourseEditorRouterLogic,
        with model: ITCHCourseEditorModel.Local.ITCHCourse?,
        networkService: ITCHCourseEditorWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.id = id
        self.presenter = presenter
        self.course = model
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: course)
    }
    
    func loadChangeCourse(with model: ITCHCourseEditorModel.Local.ITCHCourse) {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.changeCourse(
            for: tokensModel.token,
            with: id,
            model: ITCHCourseEditorModel.Network.ITCHCourse(
                courseName: model.name,
                location: model.location,
                duration: ITCHCourseEditorModel.Network.Duration(start: model.startModule, end: model.endModule),
                refToChat: model.chatLink,
                refToGrades: model.gradesLink
            ),
            completion: { [weak self] result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.presenter.popViewController()
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        )
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadCreateSchedule(with model: ITCHCourseEditorModel.Local.ITCHCourse) {
        presenter.routeToCreateSchedule(with: model)
    }
}
