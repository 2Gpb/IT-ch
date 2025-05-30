//
//  ITCHSignUpEndpoint.swift
//  ITCHAuthorization
//
//  Created by Peter on 24.05.2025.
//

import ITCHNetworking

enum ITCHSignUpEndpoint: ITCHEndpoint {
    case sendCode
    
    var compositePath: String {
        switch self {
        case .sendCode:
            return "/register/init"
        }
    }
    
    var headers: [String: String] { 
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String: String]? { [:] }
}
