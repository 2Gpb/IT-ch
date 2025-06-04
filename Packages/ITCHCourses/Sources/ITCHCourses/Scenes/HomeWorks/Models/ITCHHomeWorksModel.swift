//
//  ITCHHomeWorksModel.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

enum ITCHHomeWorksModel {
    enum Network {
        struct ITCHHomeWorkStudent: Codable {
            let id: Int
            let title: String
            let deadline: String
            let refToHomework: String?
            let refToSubmitForm: String?
        }
        
        struct ITCHHomeWorkTeacher: Codable {
            let id: Int
            let title: String
            let deadline: String
            let refToHomework: String?
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
            
            init(
                id: Int,
                title: String,
                date: String,
                linkOnTask: String,
                linkForCheck: String? = nil,
                linkForLoad: String? = nil
            ) {
                self.id = id
                self.title = title
                self.date = date
                self.linkOnTask = linkOnTask
                self.linkForCheck = linkForCheck
                self.linkForLoad = linkForLoad
            }
        }
    }
}
