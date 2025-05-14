//
//  ITCHHomeWorkEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

protocol ITCHHomeWorkEditorBusinessLogic {
    func loadStart()
    func loadDismiss()
}

protocol ITCHHomeWorkEditorPresentationLogic {
    func presentStart(for mode: ITCHEditingMode, with model: ITCHHomeWorkModel?)
}

protocol ITCHHomeWorkEditorRouterLogic {
    func popViewController()
}
