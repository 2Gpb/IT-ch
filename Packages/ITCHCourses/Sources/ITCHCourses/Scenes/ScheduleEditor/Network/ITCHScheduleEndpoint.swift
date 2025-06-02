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
    
    var compositePath: String {
        switch self {
        case .createCourse:
            return "/api/course/create"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .createCourse(let token):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
