//
//  ITCHCourseTests.swift
//  ITCHCourses
//
//  Created by Peter on 04.06.2025.
//

import XCTest
@testable import ITCHCourses
@testable import ITCHCore
@testable import ITCHUtilities

final class ITCHCourseTests: XCTestCase {
    private var interactor: ITCHCourseInteractor!
    private var presenter: ITCHCoursePresenterMock!
    private var networkService: ITCHCourseServiceMock!
    private var secureService: ITCHSecureServiceMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        presenter = ITCHCoursePresenterMock()
        networkService = ITCHCourseServiceMock()
        secureService = ITCHSecureServiceMock()
        interactor = ITCHCourseInteractor(
            with: 1,
            presenter: presenter,
            networkService: networkService,
            secureService: secureService
        )
    }

    override func tearDownWithError() throws {
        presenter = nil
        networkService = nil
        secureService = nil
        interactor = nil
        try super.tearDownWithError()
    }
    
    func testLoadStart() {
        secureService.set(tokensModel: ITCHAccessToken(token: "mock-token", refreshToken: "refresh"))
        networkService.mockResult = ITCHCurrentCourseModel.Network.ITCHCourse(
            courseName: "Math",
            location: "Room 101",
            refToChat: "chat",
            refToGrades: "grades",
            duration: ITCHCurrentCourseModel.DurationRange(start: 1, end: 2),
            courseRole: "STUDENT",
            teacherName: "Ivanov",
            schedule: ITCHCurrentCourseModel.Schedule(
                frequency: "Раз в неделю",
                academicHours: 2,
                dayOfWeek: "Понедельник",
                startTime: "10:00"
            )
        )
        
        let expectation = XCTestExpectation(description: "Course loaded and presented")
        presenter.onPresentStart = {
            expectation.fulfill()
        }
        
        interactor.loadStart()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(presenter.didPresentStart)
        XCTAssertEqual(presenter.role, .student)
    }
    
    func testDeleteCourse() {
        secureService.set(tokensModel: ITCHAccessToken(token: "mock-token", refreshToken: "refresh"))
        
        let expectation = XCTestExpectation(description: "Course delete loaded")
        presenter.onPresentStart = {
            expectation.fulfill()
        }
        
        interactor.loadDeleteCourse()
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(presenter.didPop)
    }
    
    func testLoadChangeCourse() {
        interactor.course = ITCHCurrentCourseModel.Local.ITCHCourse(
            courseName: "Math",
            teacherName: "Ivanov",
            avatar: nil,
            durationLocation: ["1, 2 модули", "Аудитория 101"],
            role: "STUDENT",
            chatLink: "chat-link",
            gradesLink: "grades-link",
            schedule: ITCHCurrentCourseModel.Schedule(
                frequency: "Раз в неделю",
                academicHours: 2,
                dayOfWeek: "Понедельник",
                startTime: "10:00"
            )
        )

        interactor.loadChangeCourse()

        // then
        XCTAssertTrue(presenter.didRouteToChangeCourse)
        XCTAssertEqual(presenter.passedCourseModel?.name, "Math")
        XCTAssertEqual(presenter.passedCourseModel?.startModule, 1)
        XCTAssertEqual(presenter.passedCourseModel?.endModule, 2)
        XCTAssertEqual(presenter.passedCourseModel?.location, "Аудитория 101")
    }
    
    func testLoadChangeSchedule() {
        interactor.course = ITCHCurrentCourseModel.Local.ITCHCourse(
            courseName: "Math",
            teacherName: "Ivanov",
            avatar: nil,
            durationLocation: ["1, 2 модули", "Аудитория 101"],
            role: "STUDENT",
            chatLink: "chat-link",
            gradesLink: "grades-link",
            schedule: ITCHCurrentCourseModel.Schedule(
                frequency: "Раз в неделю",
                academicHours: 2,
                dayOfWeek: "Понедельник",
                startTime: "10:00"
            )
        )

        interactor.loadChangeSchedule()
        
        XCTAssertTrue(presenter.didRouteToChangeSchedule)
        XCTAssertEqual(presenter.passedScheduleModel?.dayOfWeek, "Понедельник")
        XCTAssertEqual(presenter.passedScheduleModel?.numberOfHours, 2)
        XCTAssertEqual(presenter.passedScheduleModel?.time, "10:00")
        XCTAssertEqual(presenter.passedScheduleModel?.frequency, "Раз в неделю")
    }
}

// MARK: - Mocks
final class ITCHCoursePresenterMock: ITCHCoursePresentationLogic, ITCHCourseRouterLogic {
    var didPresentStart = false
    var role: ITCHCourseUserRole?
    var onPresentStart: (() -> Void)?
    
    var didRouteToChangeCourse = false
    var passedCourseModel: ITCHCourseEditorModel.Local.ITCHCourse?
    
    var didRouteToChangeSchedule = false
    var passedScheduleModel: ITCHScheduleEditorModel.Local.ITCHSchedule?
    
    var didPop = false
    
    func presentStart(with role: ITCHCourseUserRole) {
        didPresentStart = true
        self.role = role
        onPresentStart?()
    }
    
    func popViewController() {
        didPop = true
        onPresentStart?()
    }
    
    func routeToChangeCourse(for id: Int, with model: ITCHCourseEditorModel.Local.ITCHCourse?) {
        didRouteToChangeCourse = true
        passedCourseModel = model
    }
    
    func routeToChangeSchedule(for id: Int, with model: ITCHScheduleEditorModel.Local.ITCHSchedule?) {
        didRouteToChangeSchedule = true
        passedScheduleModel = model
    }
    
    func routeToChat(for link: String?) { }
    func routeToGrades(for link: String?) { }
    func routeToMembers(with id: Int) { }
    func routeToRecords(with id: Int, for role: ITCHCourseUserRole) { }
    func routeToHomeWorks(with id: Int, for role: ITCHCourseUserRole) { }
}

final class ITCHCourseServiceMock: ITCHCourseWorker {
    var mockResult: ITCHCurrentCourseModel.Network.ITCHCourse?
    
    func fetchCourse(
        for token: String,
        with id: Int,
        completion: ((Result<ITCHCurrentCourseModel.Network.ITCHCourse?, any Error>) -> Void)?
    ) {
        completion?(.success(mockResult))
    }
    
    func deleteCourse(
        for token: String,
        with id: Int,
        completion: ((Result<String?, any Error>) -> Void)?
    ) {
        completion?(.success("success"))
    }
}
