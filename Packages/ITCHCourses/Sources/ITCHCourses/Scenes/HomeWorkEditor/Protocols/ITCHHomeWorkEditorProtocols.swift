//
//  ITCHHomeWorkEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

protocol ITCHHomeWorkEditorBusinessLogic {
    func loadStart()
    func loadDismiss()
    func loadAddHomeWork(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork)
    func loadDeleteHomeWork()
    func loadChangeHomeWork(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork)
}

protocol ITCHHomeWorkEditorPresentationLogic {
    func presentStart(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork?)
}

protocol ITCHHomeWorkEditorRouterLogic {
    func popViewController()
}

protocol ITCHHomeWorkEditorWorker {
    func addHomeWork(
        for token: String,
        with id: Int,
        model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork,
        completion: ((Result<String?, Error>) -> Void)?
    )
    
    func deleteHomeWork(
        for token: String,
        with id: Int,
        completion: ((Result<String?, Error>) -> Void)?
    )
    
    func changeHomeWork(
        for token: String,
        with id: Int,
        model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork,
        completion: ((Result<String?, Error>) -> Void)?
    )
}
