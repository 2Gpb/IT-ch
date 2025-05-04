//
//  ITCHUserRole.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

public enum ITCHUserRole: String {
    case teacher, student, assistant
    
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "teacher":
            self = .teacher
        case "student":
            self = .student
        case "assistant":
            self = .assistant
        default:
            return nil
        }
    }
}
