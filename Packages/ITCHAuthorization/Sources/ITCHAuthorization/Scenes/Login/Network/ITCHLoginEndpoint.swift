//
//  ITCHLoginEndpoint.swift
//  ITCHAuthorization
//
//  Created by Peter on 31.05.2025.
//

import ITCHNetworking

enum ITCHLoginEndpoint: ITCHEndpoint {
    case sendLogin
    
    var compositePath: String {
        switch self {
        case .sendLogin:
            return "/sign-in"
        }
    }
    
    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String: String]? { [:] }
}
