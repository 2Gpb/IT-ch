//
//  ITCHScheduleEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 01.06.2025.
//

import ITCHNetworking

enum ITCHScheduleEndpoint: ITCHEndpoint {
    case createCourse(
        token: String
    )
    
    case changeSchedule(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .createCourse:
            return "/api/course/create"
        case .changeSchedule(_, let id):
            return "/api/schedule/\(id)/course/patch"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .createCourse(let token), .changeSchedule(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
