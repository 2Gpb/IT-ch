//
//  ITCHCourseModel.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit

enum ITCHCoursesModel {
    enum Network {
        struct ITCHCourse: Codable {
            let id: Int
            let courseName: String
            let duration: DurationRange
            let teacherName: String
            let courseRole: String
        }
    }
    
    enum Local {
        struct ITCHCourse: Codable {
            let id: Int
            let courseName: String
            let duration: DurationRange
            let avatarUrl: String?
            let teacherName: String
            let courseRole: String
        }
    }
    
    struct DurationRange: Codable {
        let start: Int
        let end: Int
    }
}
