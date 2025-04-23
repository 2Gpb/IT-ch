//
//  ITCHCourseModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import UIKit

public struct ITCHCourseModel {
    let duration: String
    let role: String
    let courseName: String
    let teacherName: String
    let avatar: UIImage
    
    public init(
        duration: String,
        role: String,
        courseName: String,
        teacherName: String,
        avatar: UIImage
    ) {
        self.duration = duration
        self.role = role
        self.courseName = courseName
        self.teacherName = teacherName
        self.avatar = avatar
    }
}
