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
    private let id: Int
    private let networkService: ITCHScheduleWorker
    private let secureService: ITCHSecureSessionLogic
    private var course: ITCHCourseEditorModel.Local.ITCHCourse?
    private var schedule: ITCHScheduleEditorModel.Local.ITCHSchedule?
    
    // MARK: - Lifecycle
    init(
        for id: Int,
        presenter: ITCHScheduleEditorPresentationLogic & ITCHScheduleEditorRouterLogic,
        networkService: ITCHScheduleWorker,
        secureService: ITCHSecureSessionLogic,
        createWith course: ITCHCourseEditorModel.Local.ITCHCourse?,
        editWith model: ITCHScheduleEditorModel.Local.ITCHSchedule?
    ) {
        self.id = id
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
    
    func loadCreate(with model: ITCHScheduleEditorModel.Local.ITCHSchedule) {
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
    
    func loadChangeSchedule(with model: ITCHScheduleEditorModel.Local.ITCHSchedule) {
        guard let tokensModel = secureService.get() else { return }
        networkService.changeSchedule(
            for: tokensModel.token,
            with: id,
            model: ITCHScheduleEditorModel.Network.ITCHSchedule(
                frequency: ITCHFrequency(russianString: model.frequency)?.rawValue ?? "",
                academicHours: model.numberOfHours,
                dayOfWeek: ITCHWeekday(russianString: model.dayOfWeek)?.rawValue ?? "",
                startTime: model.time,
                startDate: "2025-09-02"
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
    
    func loadCourses() {
        presenter.routeToCourses()
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
