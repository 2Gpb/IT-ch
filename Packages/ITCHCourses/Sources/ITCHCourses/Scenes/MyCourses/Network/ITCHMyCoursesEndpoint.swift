//
//  ITCHMyCoursesEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 24.05.2025.
//

import ITCHNetworking

enum ITCHMyCoursesEndpoint: ITCHEndpoint {
    case courses(
        token: String
    )
    
    var compositePath: String {
        switch self {
        case .courses:
            return "/api/course"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .courses(let token):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
