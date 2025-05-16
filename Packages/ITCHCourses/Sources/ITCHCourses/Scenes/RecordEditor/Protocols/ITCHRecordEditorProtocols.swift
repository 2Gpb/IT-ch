//
//  ITCHRecordEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

protocol ITCHRecordEditorBusinessLogic {
    func loadStart()
    func loadDismiss()
}

protocol ITCHRecordEditorPresentationLogic {
    func presentStart(with model: ITCHRecordModel?)
}

protocol ITCHRecordEditorRouterLogic {
    func popViewController()
}
