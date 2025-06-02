//
//  ITCHScheduleEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 07.05.2025.
//

import ITCHCore
import Foundation
import ITCHNetworking

final class ITCHScheduleEditorInteractor: ITCHScheduleEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic
    private let networkService: ITCHScheduleWorker
    private let secureService: ITCHSecureSessionLogic
    private var course: ITCHCourseEditorModel?
    private var schedule: ITCHScheduleEditorModel?
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic,
        networkService: ITCHScheduleWorker,
        secureService: ITCHSecureSessionLogic,
        createWith course: ITCHCourseEditorModel?,
        editWith model: ITCHScheduleEditorModel?
    ) {
        self.presenter = presenter
        self.networkService = networkService
        self.secureService = secureService
        self.course = course
        self.schedule = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: schedule)
    }
    
    func loadCreate(with model: ITCHScheduleEditorModel) {
        guard let course else { return }
        networkService.sendCourseInfo(
            for: secureService.get()?.token ?? "token",
            model: ITCHCreateCourseModel.Network.ITCHDTOCreateCourse(
                courseName: course.name,
                location: course.location,
                duration: ITCHCreateCourseModel.Network.Duration(start: course.startModule, end: course.endModule),
                refToChat: course.chatLink,
                refToGrades: course.gradesLink,
                schedule: ITCHCreateCourseModel.Network.Schedule(
                    dayOfWeek: model.dayOfWeek,
                    academicHours: model.numberOfHours,
                    startTime: model.time,
                    frequency: model.frequency,
                    startDate: "2025-09-02"
                )
            ),
            completion: { [weak self] result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.presenter.routeToCourses()
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
    
    func loadChangeSchedule(with model: ITCHScheduleEditorModel) {
        schedule = model
    }
    
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
