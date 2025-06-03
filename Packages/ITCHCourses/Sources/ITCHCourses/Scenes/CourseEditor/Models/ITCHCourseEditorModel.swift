//
//  ITCHCourseEditorModel.swift
//  ITCHCourses
//
//  Created by Peter on 15.05.2025.
//

enum ITCHCourseEditorModel {
    enum Network {
        struct ITCHCourse: Codable {
            let courseName: String
            let location: String
            let duration: Duration
            let refToChat: String
            let refToGrades: String
        }
        
        struct Duration: Codable {
            let start: Int
            let end: Int
        }
    }
    
    enum Local {
        struct ITCHCourse {
            let name: String
            let location: String
            let startModule: Int
            let endModule: Int
            let chatLink: String
            let gradesLink: String
        }
    }
}
