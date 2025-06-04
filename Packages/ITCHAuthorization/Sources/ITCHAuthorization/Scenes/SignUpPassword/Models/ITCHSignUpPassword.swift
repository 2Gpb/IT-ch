//
//  ITCHSignUpPassword.swift
//  ITCHAuthorization
//
//  Created by Peter on 31.05.2025.
//

enum ITCHSignUpPassword {
    enum Network {
        struct ITCHDTOPassword: Codable {
            let email: String
            let password: String
        }
    }
}
