//
//  ITCHHomeWorkViewModel.swift
//  ITCHUIComponents
//
//  Created by Peter on 18.05.2025.
//

import Foundation
import ITCHUtilities

public struct ITCHHomeWorkViewModel {
    let title: String
    let date: Date
    let role: ITCHCourseUserRole
    let openAction: (() -> Void)?
    let solutionsAction: (() -> Void)?
    let editAction: (() -> Void)?
    
    public init(
        title: String,
        date: Date,
        role: ITCHCourseUserRole,
        openAction: (() -> Void)?,
        solutionsAction: (() -> Void)?,
        editAction: (() -> Void)?
    ) {
        self.title = title
        self.date = date
        self.role = role
        self.openAction = openAction
        self.solutionsAction = solutionsAction
        self.editAction = editAction
    }
}
