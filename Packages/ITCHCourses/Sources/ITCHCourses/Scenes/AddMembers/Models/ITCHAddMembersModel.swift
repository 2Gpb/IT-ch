//
//  ITCHAddMembersModel.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

enum ITCHAddMembersModel {
    enum Network {
        struct ITCHMember: Codable {
            let id: Int
            let fullName: String
            let role: String
        }
        
        struct ITCHAddedMembers: Codable {
            let userIds: [Int]
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
