//
//  ITCHCoursesEmptyState.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import ITCHUtilities

enum ITCHCoursesEmptyState {
    case teacher, student, assistant
    
    var title: String {
        return "У вас пока нет курсов"
    }
    
    var subTitle: String {
        switch self {
        case .teacher:
            return "Создайте свой первый курс, нажав\nна плюс в правом верхнем углу."
        case .student, .assistant:
            return "Вы сможете присоединиться,\nкак только вас пригласят."
        }
    }
    
    static func from(role: ITCHUserRole) -> ITCHCoursesEmptyState {
        switch role {
        case .teacher: return .teacher
        case .student: return .student
        case .assistant: return .assistant
        }
    }
}
