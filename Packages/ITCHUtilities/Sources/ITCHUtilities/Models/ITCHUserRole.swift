//
//  ITCHUserRole.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

public enum ITCHUserRole: String, Codable {
    case teacher, student
    
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "teacher":
            self = .teacher
        case "student":
            self = .student
        default:
            return nil
        }
    }
    
    public var roleDescription: String {
        switch self {
        case .student:
            return "Студент"
        case .teacher:
            return "Преподаватель"
        }
    }
}
