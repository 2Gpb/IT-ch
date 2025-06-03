//
//  ITCHRecordEditorEndpoint.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import ITCHNetworking

enum ITCHRecordEditorEndpoint: ITCHEndpoint {
    case addRecord(
        token: String,
        id: Int
    )
    
    var compositePath: String {
        switch self {
        case .addRecord(_, let id):
            return "/api/records/\(id)/course/add"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .addRecord(let token, _):
            headers["Authorization"] = "Bearer \(token)"
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
