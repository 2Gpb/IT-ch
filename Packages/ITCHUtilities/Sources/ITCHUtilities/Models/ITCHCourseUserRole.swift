//
//  ITCHCourseUserRole.swift
//  ITCHCourses
//
//  Created by Peter on 15.05.2025.
//

public enum ITCHCourseUserRole: String {
    case teacher = "TEACHER"
    case student = "STUDENT"
    case assistant = "ASSISTANT"
    case none = "NONE"
    
    public var text: String {
        switch self {
        case .teacher:
            return "Преподаватель"
        case .student:
            return "Студент"
        case .assistant:
            return "Ассистент"
        case .none:
            return "Неизвестная роль"
        }
    }
}
