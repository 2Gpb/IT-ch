//
//  ITCHEnterCode.swift
//  ITCHAuthorization
//
//  Created by Peter on 30.05.2025.
//

enum ITCHEnterCode {
    enum Network {
        struct ITCHDTOCode: Codable {
            let email: String
            let code: String
        }
    }
}
