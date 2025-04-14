//
//  ITCHDeadlineModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import Foundation

public struct ITCHDeadlineModel {
    public let course: String
    public let text: String
    public let deadline: Date
    
    public init(course: String, text: String, deadline: Date) {
        self.course = course
        self.text = text
        self.deadline = deadline
    }
}
