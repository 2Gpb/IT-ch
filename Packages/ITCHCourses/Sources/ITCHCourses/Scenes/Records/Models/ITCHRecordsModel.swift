//
//  ITCHRecordModel.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

enum ITCHRecordsModel {
    enum Network {
        struct ITCHRecord: Codable {
            let id: Int
            let title: String
            let refToVideo: String
        }
    }
    
    enum Local {
        struct ITCHRecord: Codable {
            let id: Int
            let dateTitle: String
            let videoLink: String
        }
    }
}
