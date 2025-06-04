//
//  ITCHRecordEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHRecordEndpoint: ITCHEndpoint {
    case records(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .records(_, let id):
            return "/api/records/\(id)/course/get"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .records(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
