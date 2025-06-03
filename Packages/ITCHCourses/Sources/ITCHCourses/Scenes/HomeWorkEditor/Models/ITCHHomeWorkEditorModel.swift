//
//  ITCHHomeWorkEditorModel.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

enum ITCHHomeWorkEditorModel {
    enum Network {
        struct ITCHHomeWork: Codable {
            let title: String
            let deadline: String
            let refToHomework: String
            let refToSubmitForm: String?
            let refToSolutionView: String?
        }
    }
    
    enum Local {
        struct ITCHHomeWork {
            let id: Int
            let title: String
            let date: String
            let linkOnTask: String
            let linkForCheck: String?
            let linkForLoad: String?
        }
    }
}
