//
//  ITCHNotificationType.swift
//  ITCHNotifications
//
//  Created by Peter on 01.05.2025.
//

enum ITCHNotificationType {
    case record
    case task
    
    var text: String {
        switch self {
        case .record:
            return "Запись"
        case .task:
            return "Задание"
        }
    }
}
