//
//  ITCHCreateCourseModel.swift
//  ITCHCourses
//
//  Created by Peter on 01.06.2025.
//

enum ITCHCreateCourseModel {
    enum Network {
        struct ITCHDTOCreateCourse: Codable {
            let courseName: String
            let location: String
            let duration: Duration
            let refToChat: String
            let refToGrades: String
            let schedule: Schedule
        }
        
        struct Duration: Codable {
            let start: Int
            let end: Int
        }
        
        struct Schedule: Codable {
            let dayOfWeek: String
            let academicHours: Int
            let startTime: String
            let frequency: String
            let startDate: String
        }
    }
}
