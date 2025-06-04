//
//  ITCHMembersEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 02.06.2025.
//

import ITCHNetworking

enum ITCHMembersEndpoint: ITCHEndpoint {
    case membersOfCourse(
        token: String,
        id: Int
    )
    
    case deleteMember(
        token: String,
        courseId: Int,
        userId: Int
    )
    
    var compositePath: String {
        switch self {
        case .membersOfCourse(_, let id):
            return "/api/course/\(id)/participants"
        case .deleteMember(_, let courseId, let userId):
            return "/api/course/\(courseId)/delete/\(userId)"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .membersOfCourse(let token, _), .deleteMember(let token, _, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
