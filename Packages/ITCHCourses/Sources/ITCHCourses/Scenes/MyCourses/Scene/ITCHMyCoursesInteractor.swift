//
//  ITCHMyCoursesInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit
import ITCHUIComponents
import ITCHCore
import ITCHUtilities
import ITCHNetworking

final class ITCHMyCoursesInteractor: NSObject, ITCHMyCoursesBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHMyCoursesPresentationLogic & ITCHMyCoursesRouterLogic
    private let networkService: ITCHMyCoursesWorker
    private let secureSessionService: ITCHSecureSessionLogic
    private let userRoleService: ITCHUserRoleLogic
    
    // MARK: - Variables
    private var courses: [ITCHCoursesModel.Local.ITCHCourse] = []
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHMyCoursesPresentationLogic & ITCHMyCoursesRouterLogic,
        networkService: ITCHMyCoursesWorker,
        secureSessionService: ITCHSecureSessionLogic,
        userRoleService: ITCHUserRoleLogic
    ) {
        self.presenter = presenter
        self.networkService = networkService
        self.secureSessionService = secureSessionService
        self.userRoleService = userRoleService
    }
    
    // MARK: - Methods
    func loadStart() {
        if let user = userRoleService.get() {
            presenter.presentStart(with: user.role)
        }
    }
    
    func loadCourse(for index: Int) {
        presenter.roteToCourse(with: courses[index])
    }
    
    func loadCreateCourse() {
        presenter.routeToCreateCourse()
    }
    
    // MARK: - Private methods
    func loadCourses() {
        guard let tokenModel = secureSessionService.get() else { return }
        networkService.fetchCourses(
            for: tokenModel.token,
            completion: { [weak self] response in
                guard let self else { return }
                switch response {
                case .success(let courses):
                    self.courses = courses?.map { course in
                        ITCHCoursesModel.Local.ITCHCourse(
                                id: course.id,
                                courseName: course.courseName,
                                duration: course.duration,
                                avatarUrl: nil,
                                teacherName: course.teacherName,
                                courseRole: ITCHUserRole(rawValue: course.courseRole)?.roleDescription ?? "-"
                            )
                    } ?? []
                    
                    DispatchQueue.main.async {
                        self.presenter.presentCourses(isEmpty: self.courses.isEmpty)
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error)
                    }
                }
            }
        )
    }
}

// MARK: - UITableViewDataSource
extension ITCHMyCoursesInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHCourseCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHCourseCell else {
            return rawCell
        }
        
        let model = courses[indexPath.row]
        let range = Array(model.duration.start...model.duration.end)
        let postfix = range.count == 1 ? " модуль" : " модулей"
        cell.configure(
            with: ITCHCourseViewModel(
                duration: range.joinedString() + postfix,
                role: model.courseRole,
                courseName: model.courseName,
                teacherName: model.teacherName,
                avatar: nil
            )
        )
        
        return cell
    }
}
