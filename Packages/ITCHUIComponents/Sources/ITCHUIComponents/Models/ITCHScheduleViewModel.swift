//
//  ITCHScheduleViewModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 15.04.2025.
//

public struct ITCHScheduleViewModel {
    public var courseName: String
    public var location: String
    public var timeInterval: String
    
    public init(courseName: String, location: String, timeInterval: String) {
        self.courseName = courseName
        self.location = location
        self.timeInterval = timeInterval
    }
}
