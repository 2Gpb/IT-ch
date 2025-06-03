//
//  ITCHAddMembersEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHAddMembersEndpoint: ITCHEndpoint {
    case allMembers(token: String)
    case addMembers(token: String, id: Int)
    
    var compositePath: String {
        switch self {
        case .allMembers:
            return "/api/users"
        case .addMembers(_, let id):
            return "/api/course/\(id)/participants"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .allMembers(let token), .addMembers(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
