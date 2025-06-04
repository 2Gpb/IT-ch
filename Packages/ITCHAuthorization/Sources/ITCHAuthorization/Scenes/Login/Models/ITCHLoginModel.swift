//
//  ITCHLoginModel.swift
//  ITCHAuthorization
//
//  Created by Peter on 31.05.2025.
//

enum ITCHLoginModel {
    enum Network {
        struct ITCHDTOLogin: Codable {
            let email: String
            let password: String
        }
    }
}
