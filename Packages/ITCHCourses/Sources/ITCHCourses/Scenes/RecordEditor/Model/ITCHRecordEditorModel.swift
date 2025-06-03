//
//  ITCHRecordEditorModel.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

enum ITCHRecordEditorModel {
    enum Network {
        struct ITCHRecord: Codable {
            let title: String
            let refToVideo: String
        }
    }
}
