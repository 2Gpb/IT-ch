//
//  ITCHScheduleModel.swift
//  ITCHCourses
//
//  Created by Peter on 15.05.2025.
//

enum ITCHScheduleEditorModel {
    enum Network {
        struct ITCHSchedule: Codable {
            let frequency: String
            let academicHours: Int
            let dayOfWeek: String
            let startTime: String
            let startDate: String
        }
    }
    
    enum Local {
        struct ITCHSchedule {
            let dayOfWeek: String
            let numberOfHours: Int
            let time: String
            let frequency: String
        }
    }
}

enum ITCHWeekday: String, CaseIterable {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
    case saturday = "SATURDAY"
    case sunday = "SUNDAY"
    
    init?(russianString: String) {
        switch russianString.lowercased() {
        case "понедельник":
            self = .monday
        case "вторник":
            self = .tuesday
        case "среда":
            self = .wednesday
        case "четверг":
            self = .thursday
        case "пятница":
            self = .friday
        case "суббота":
            self = .saturday
        case "воскресенье":
            self = .sunday
        default:
            return nil
        }
    }
}

enum ITCHFrequency: String {
    case onceAWeek = "ONCE_A_WEEK"
    case onceEveryTwoWeeks = "ONCE_EVERY_TWO_WEEKS"
    
    init?(russianString: String) {
        switch russianString.lowercased() {
        case "1 раз в неделю":
            self = .onceAWeek
        case "1 раз в 2 недели":
            self = .onceEveryTwoWeeks
        default:
            return nil
        }
    }
}
