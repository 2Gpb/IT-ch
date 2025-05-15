//
//  ITCHCurrentCourseActions.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import ITCHUtilities
import UIKit

enum ITCHCurrentCourseAction: Int {
    case chat = 0
    case grades
    case members
    case recordings
    case homework
    
    static func titleActions(for role: ITCHCourseUserRole) -> [String] {
        switch role {
        case .teacher:
            return ["Чат курса", "Оценки", "Участники", "Записи", "Домашние задания"]
        case .student:
            return ["Чат курса", "Оценки", "Записи", "Домашние задания"]
        case .assistant:
            return ["Чат курса", "Оценки", "Домашние задания"]
        case .none:
            return []
        }
    }
    
    static func numberAvailableActions(for role: ITCHCourseUserRole) -> [ITCHCurrentCourseAction] {
        switch role {
        case .teacher:
            return [.chat, .grades, .members, .recordings, .homework]
        case .student:
            return [.chat, .grades, .recordings, .homework]
        case .assistant:
            return [.chat, .grades, .homework]
        case .none:
            return []
        }
    }
    
    static func action(for indexPath: IndexPath, role: ITCHCourseUserRole) -> ITCHCurrentCourseAction? {
        let available = numberAvailableActions(for: role)
        guard indexPath.row < available.count else { return nil }
        return available[indexPath.row]
    }
}
