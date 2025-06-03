//
//  ITCHCourseEditorEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHCourseEditorEndpoint: ITCHEndpoint {
    case changeCourse(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .changeCourse(_, let id):
            return "/api/course/\(id)/patch"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .changeCourse(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
