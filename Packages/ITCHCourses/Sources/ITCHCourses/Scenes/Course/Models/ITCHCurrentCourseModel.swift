//
//  ITCHCurrentCourseViewModel.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit

struct ITCHCurrentCourseModel {
    let courseName: String
    let teacherName: String
    let avatar: UIImage?
    let durationLocation: [String]
    let role: String
    let chatLink: String?
    let gradesLink: String?
    var dayOfWeek: String
    var numberOfHours: Int
    var time: String
    var frequency: String
}
