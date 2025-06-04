//
//  ITCHCurrentCourseViewModel.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit

enum ITCHCurrentCourseModel {
    enum Network {
        struct ITCHCourse: Codable {
            let courseName: String
            let location: String
            let refToChat: String
            let refToGrades: String
            let duration: DurationRange
            let courseRole: String
            let teacherName: String
            let schedule: Schedule
        }
    }
    
    enum Local {
        struct ITCHCourse {
            let courseName: String
            let teacherName: String
            let avatar: UIImage?
            let durationLocation: [String]
            let role: String
            let chatLink: String
            let gradesLink: String
            let schedule: Schedule
        }
    }
    
    struct DurationRange: Codable {
        let start: Int
        let end: Int
    }
    
    struct Schedule: Codable {
        let frequency: String
        let academicHours: Int
        let dayOfWeek: String
        let startTime: String
    }
}
