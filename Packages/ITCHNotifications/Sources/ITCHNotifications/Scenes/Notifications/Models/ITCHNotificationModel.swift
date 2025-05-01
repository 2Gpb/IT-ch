//
//  ITCHNotificationModel.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

import Foundation

struct ITCHNotificationModel {
    var courseName: String
    var title: String
    var date: Date
    var text: String
    var type: ITCHNotificationType
    var isNewNotify: Bool = false
}
