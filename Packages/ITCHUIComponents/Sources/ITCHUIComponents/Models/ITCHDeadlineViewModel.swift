//
//  ITCHDeadlineViewModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 14.04.2025.
//

import Foundation

public struct ITCHDeadlineViewModel {
    public let course: String
    public let text: String
    public let deadline: Date
    public let isChecked: Bool
    
    public init(course: String, text: String, deadline: Date, isChecked: Bool) {
        self.course = course
        self.text = text
        self.deadline = deadline
        self.isChecked = isChecked
    }
}
