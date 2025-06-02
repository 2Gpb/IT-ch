//
//  ITCHCourseEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 02.06.2025.
//

import ITCHNetworking

enum ITCHCourseEndpoint: ITCHEndpoint {
    case course(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .course(_, let id):
            return "/api/course/\(id)"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .course(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
