//
//  ITCHHomeWorksEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHHomeWorksEndpoint: ITCHEndpoint {
    case homeWorksStudent(
        token: String,
        id: Int
    )
    
    case homeWorksTeacher(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .homeWorksStudent(_, let id):
            return "/api/homework/\(id)/student"
        case .homeWorksTeacher(_, let id):
            return "/api/homework/\(id)/teacher"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .homeWorksStudent(let token, _), .homeWorksTeacher(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
