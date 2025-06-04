//
//  ITCHSplashEndpoint.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import ITCHNetworking

enum ITCHSplashEndpoint: ITCHEndpoint {
    case checkAccess(token: String)
    case refresh
    
    var compositePath: String {
        switch self {
        case .checkAccess:
            return "/api/course"
        case .refresh:
            return "/refresh"
        }
    }
    
    var headers: [String: String] {
        var headers: [String: String] = [:]
        switch self {
        case .checkAccess(let token):
            headers["Authorization"] = "Bearer \(token)"
        case .refresh:
            break
        }
        
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    var parameters: [String: String]? { [:] }
}
