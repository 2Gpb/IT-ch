//
//  ITCHMemberModel.swift
//  ITCHCourses
//
//  Created by Peter on 02.06.2025.
//

enum ITCHMembersModel {
    enum Network {
        struct ITCHMember: Codable {
            let userId: Int
            let fullName: String
            let courseRole: String
        }
    }
    
    enum Local {
        struct ITCHMember: Codable {
            let id: Int
            let name: String
            let role: String
        }
    }
}
