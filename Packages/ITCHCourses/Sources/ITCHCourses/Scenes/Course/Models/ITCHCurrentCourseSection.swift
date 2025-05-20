//
//  ITCHCurrentCourseSection.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

enum ITCHCurrentCourseSection: Int, CaseIterable {
    case course = 0
    case teacher
    case info
    case role
    case actions
}

extension ITCHCurrentCourseSection {
    var title: String? {
        switch self {
        case .course: return "КУРС"
        case .teacher: return "ПРЕПОДАВАТЕЛЬ"
        case .info: return "ОБЩАЯ ИНФОРМАЦИЯ"
        case .role: return "ВАША РОЛЬ"
        case .actions: return nil
        }
    }
}
