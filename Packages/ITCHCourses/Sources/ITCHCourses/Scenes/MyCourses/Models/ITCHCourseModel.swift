//
//  ITCHCourseModel.swift
//  ITCHCourses
//
//  Created by Peter on 04.05.2025.
//

import UIKit

struct ITCHCourseModel {
    let courseName: String
    let teacherName: String
    let avatar: UIImage?
    var startModule: Int
    var endModule: Int
    let location: String
    let role: String
    let chatLink: String?
    let gradesLink: String?
    var dayOfWeek: String
    var numberOfHours: Int
    var time: String
    var frequency: String
}
