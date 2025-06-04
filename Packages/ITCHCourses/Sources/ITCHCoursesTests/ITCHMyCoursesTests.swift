//
//  ITCHMyCoursesTests.swift
//  ITCHCourses
//
//  Created by Peter on 04.06.2025.
//

import XCTest
@testable import ITCHCourses
@testable import ITCHCore
@testable import ITCHUtilities

// MARK: - Tests
final class ITCHMyCoursesTests: XCTestCase {
    private var interactor: ITCHMyCoursesInteractor!
    private var presenter: ITCHMyCoursesPresenterMock!
    private var networkService: ITCHMyCoursesServiceMock!
    private var secureService: ITCHSecureServiceMock!
    private var roleService: ITCHUserRoleServiceMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        presenter = ITCHMyCoursesPresenterMock()
        networkService = ITCHMyCoursesServiceMock()
        secureService = ITCHSecureServiceMock()
        roleService = ITCHUserRoleServiceMock()
        interactor = ITCHMyCoursesInteractor(
            presenter: presenter,
            networkService: networkService,
            secureSessionService: secureService,
            userRoleService: roleService
        )
    }

    override func tearDownWithError() throws {
        presenter = nil
        networkService = nil
        secureService = nil
        roleService = nil
        interactor = nil
        try super.tearDownWithError()
    }

    override func setUp() {
        super.setUp()
        presenter = ITCHMyCoursesPresenterMock()
        networkService = ITCHMyCoursesServiceMock()
        secureService = ITCHSecureServiceMock()
        roleService = ITCHUserRoleServiceMock()
        interactor = ITCHMyCoursesInteractor(
            presenter: presenter,
            networkService: networkService,
            secureSessionService: secureService,
            userRoleService: roleService
        )
    }

    func testLoadStart() {
        roleService.roleToReturn = ITCHUserInfo(email: "", role: .student)
        interactor.loadStart()
        
        XCTAssertEqual(presenter.presentedStartRole, .student)
    }

    func testLoadCourses() {
        secureService.set(tokensModel: ITCHAccessToken(token: "mock-token", refreshToken: "refresh"))
        networkService.mockResult = [
            ITCHCoursesModel.Network.ITCHCourse(
                id: 0,
                courseName: "",
                duration: ITCHCoursesModel.DurationRange(start: 0, end: 0),
                teacherName: "",
                courseRole: ""
            )
        ]
        
        let expectation = XCTestExpectation(description: "Courses loaded and presented")
        presenter.onPresentCourses = {
            expectation.fulfill()
        }
        
        interactor.loadCourses()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(presenter.didPresentCourses)
        XCTAssertEqual(interactor.courses.count, 1)
    }

    func testLoadCreateCourse() {
        interactor.loadCreateCourse()
        XCTAssertTrue(presenter.didRouteToCreateCourse)
    }

    func testLoadCourse() {
        interactor.courses = [
            ITCHCoursesModel.Local.ITCHCourse(
                id: 1,
                courseName: "",
                duration: ITCHCoursesModel.DurationRange(start: 0, end: 0),
                avatarUrl: nil,
                teacherName: "",
                courseRole: ""
            )
        ]
        
        interactor.loadCourse(for: 0)
        
        XCTAssertEqual(presenter.didRouteToCourseID, 1)
    }
}

// MARK: - Mocks
final class ITCHMyCoursesPresenterMock: ITCHMyCoursesPresentationLogic, ITCHMyCoursesRouterLogic {
    var presentedStartRole: ITCHUserRole?
    var didPresentCourses: Bool = false
    var onPresentCourses: (() -> Void)?
    var didRouteToCourseID: Int?
    var didRouteToCreateCourse = false

    func presentStart(with role: ITCHUserRole?) {
        presentedStartRole = role
    }

    func presentCourses(isEmpty: Bool) {
        didPresentCourses = true
        onPresentCourses?()
    }

    func routeToCourse(with id: Int) {
        didRouteToCourseID = id
    }

    func routeToCreateCourse() {
        didRouteToCreateCourse = true
    }
}

final class ITCHMyCoursesServiceMock: ITCHMyCoursesWorker {
    var mockResult = [
        ITCHCoursesModel.Network.ITCHCourse(
            id: 1,
            courseName: "",
            duration: ITCHCoursesModel.DurationRange(start: 0, end: 0),
            teacherName: "",
            courseRole: ""
        )
    ]

    func fetchCourses(
        for token: String,
        completion: ((Result<[ITCHCoursesModel.Network.ITCHCourse]?, Error>) -> Void)?
    ) {
        completion?(.success(mockResult))
    }
}
