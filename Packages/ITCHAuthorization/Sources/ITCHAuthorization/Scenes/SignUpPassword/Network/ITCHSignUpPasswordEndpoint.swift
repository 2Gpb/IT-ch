//
//  ITCHSignUpPasswordEndpoint.swift
//  ITCHAuthorization
//
//  Created by Peter on 31.05.2025.
//

import ITCHNetworking

enum ITCHSignUpPasswordEndpoint: ITCHEndpoint {
    case sendPassword
    
    var compositePath: String {
        switch self {
        case .sendPassword:
            return "/register/complete"
        }
    }
    
    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String: String]? { [:] }
}
