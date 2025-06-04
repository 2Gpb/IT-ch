//
//  ITCHHomeWorksEditorEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHHomeWorksEditorEndpoint: ITCHEndpoint {
    case addHomeWork(
        token: String,
        id: Int
    )
    
    case deleteHomeWork(
        token: String,
        id: Int
    )
    
    case changeHomeWork(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .addHomeWork(_, let id):
            return "/api/homework/\(id)/create"
        case .deleteHomeWork(_, let id):
            return "/api/homework/\(id)/delete"
        case .changeHomeWork(_, let id):
            return "/api/homework/\(id)/patch"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .addHomeWork(let token, _), .deleteHomeWork(let token, _), .changeHomeWork(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
