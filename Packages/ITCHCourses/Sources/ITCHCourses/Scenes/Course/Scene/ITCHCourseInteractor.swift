//
//  ITCHCourseInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 09.05.2025.
//

import UIKit
import ITCHCore
import ITCHUtilities
import ITCHNetworking

final class ITCHCourseInteractor: NSObject, ITCHCourseBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic
    private let networkService: ITCHCourseWorker
    private let secureService: ITCHSecureSessionService
    
    private var actionRowTitles: [String] = []
    private let id: Int
    private var course: ITCHCurrentCourseModel.Local.ITCHCourse?
    private let titles = ["КУРС", "ПРЕПОДАВАТЕЛЬ", "ОБЩАЯ ИНФОРМАЦИЯ", "ВАША РОЛЬ"]
    
    // MARK: - Variables
    var role: ITCHCourseUserRole = .none
    
    // MARK: - Lifecycle
    init(
        with id: Int,
        presenter: ITCHCoursePresentationLogic & ITCHCourseRouterLogic,
        networkService: ITCHCourseWorker,
        secureService: ITCHSecureSessionService
    ) {
        self.id = id
        self.presenter = presenter
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.fetchCourse(
            for: tokensModel.token,
            with: id,
            completion: { [weak self] result in
                switch result {
                case .success(let course):
                    guard let course else { return }
                    let range = Array(course.duration.start...course.duration.end)
                    let duration = range.joinedString()
                    let postfix = range.count == 1 ? " модуль" : " модулей"
                    self?.course = ITCHCurrentCourseModel.Local.ITCHCourse(
                        courseName: course.courseName,
                        teacherName: course.teacherName,
                        avatar: nil,
                        durationLocation: [duration + postfix, course.location],
                        role: course.courseRole,
                        chatLink: course.refToChat,
                        gradesLink: course.refToGrades,
                        schedule: ITCHCurrentCourseModel.Schedule(
                            frequency: course.schedule.frequency,
                            academicHours: course.schedule.academicHours,
                            dayOfWeek: course.schedule.dayOfWeek,
                            startTime: course.schedule.startTime
                        )
                    )
                    
                    self?.role = ITCHCourseUserRole(rawValue: course.courseRole) ?? .none
                    DispatchQueue.main.async {
                        self?.actionRowTitles = ITCHCurrentCourseAction.titleActions(for: self?.role ?? .none)
                        self?.presenter.presentStart(with: self?.role ?? .none)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
    
    func loadChangeCourse() {
//        let durationRange = course.durationLocation[0].toIntArray()
//        
//        presenter.routeToChangeCourse(
//            with: ITCHCourseEditorModel(
//                name: course.courseName,
//                location: course.durationLocation[1],
//                startModule: durationRange.first ?? 1,
//                endModule: durationRange.last ?? 1,
//                chatLink: course.chatLink,
//                gradesLink: course.gradesLink
//            )
//        )
    }
    
    func loadChangeSchedule() {
//        presenter.routeToChangeSchedule(
//            with: ITCHScheduleEditorModel(
//                dayOfWeek: course.dayOfWeek,
//                numberOfHours: course.numberOfHours,
//                time: course.time,
//                frequency: course.frequency
//            )
//        )
    }
    
    func loadDeleteCourse() {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.deleteCourse(
            for: tokensModel.token,
            with: id,
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
    
    func loadChat() {
        presenter.routeToChat(for: course?.chatLink)
    }
    
    func loadGrades() {
        presenter.routeToGrades(for: course?.gradesLink)
    }
    
    func loadMembers() {
        presenter.routeToMembers(with: id)
    }
    
    func loadRecords() {
        presenter.routeToRecords(with: id, for: role)
    }
    
    func loadHomeWorks() {
        presenter.routeToHomeWorks(with: id, for: role)
    }
}

// MARK: - UITableViewDataSource
extension ITCHCourseInteractor: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        ITCHCurrentCourseSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ITCHCurrentCourseSection(rawValue: section) else { return 0 }
        guard let course else { return 0 }
        /// with header
        switch section {
        case .info:
            return course.durationLocation.count + 1
        case .actions:
            return actionRowTitles.isEmpty ? 0 : actionRowTitles.count + 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section ) else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            return headerCell(tableView, indexPath)
        }
        
        switch section {
        case .course:
            return courseCell(tableView, indexPath)
        case .teacher:
            return teacherCell(tableView, indexPath)
        case .info:
            return infoCell(tableView, indexPath)
        case .role:
            return roleCell(tableView, indexPath)
        case .actions:
            return actionCell(tableView, indexPath)
        }
    }
}

// MARK: - Configure cells
extension ITCHCourseInteractor {
    private func headerCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHCourseHeaderCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHCourseHeaderCell else {
            return rawCell
        }
        
        guard let section = ITCHCurrentCourseSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        cell.configure(with: section.title)
        return cell
    }
    
    private func courseCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHTitleCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHTitleCell else {
            return rawCell
        }
        
        if let course { cell.configure(with: course.courseName) }
        return cell
    }

    private func teacherCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHTeacherCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHTeacherCell else {
            return rawCell
        }
        
        if let course { cell.configure(with: course.teacherName, image: course.avatar) }
        return cell
    }

    private func infoCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHTitleCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHTitleCell else {
            return rawCell
        }
        
        let actualIndex = indexPath.row - 1
        if let course {
            let text = "•  \(course.durationLocation[actualIndex])"
            cell.configure(with: text)
        }
        return cell
    }

    private func roleCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHTitleCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHTitleCell else {
            return rawCell
        }
        
        if let course {
            let roleText = ITCHCourseUserRole(rawValue: course.role)?.text ?? ""
            cell.configure(with: roleText)
        }
        return cell
    }

    private func actionCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHNavigationRowCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHNavigationRowCell else {
            return rawCell
        }
        
        let actualIndex = indexPath.row - 1
        cell.configure(with: actionRowTitles[actualIndex])
        return cell
    }
}
