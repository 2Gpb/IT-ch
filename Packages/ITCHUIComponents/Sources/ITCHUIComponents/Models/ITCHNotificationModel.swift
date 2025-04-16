//
//  ITCHNotificationModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 15.04.2025.
//

import Foundation

public struct ITCHNotificationModel {
    public var courseName: String
    public var notification: String
    public var date: Date
    public var isNewNotify: Bool = false
    
    public init(courseName: String, notification: String, date: Date, isNewNotify: Bool) {
        self.courseName = courseName
        self.notification = notification
        self.date = date
        self.isNewNotify = isNewNotify
    }
}
