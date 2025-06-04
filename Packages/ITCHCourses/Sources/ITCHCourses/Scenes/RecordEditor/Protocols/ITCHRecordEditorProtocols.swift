//
//  ITCHRecordEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

protocol ITCHRecordEditorBusinessLogic {
    func loadStart()
    func loadAddRecord(date: String, videoURL: String)
    func loadDeleteRecord()
    func loadChangeRecord(date: String, videoURL: String)
    func loadDismiss()
}

protocol ITCHRecordEditorPresentationLogic {
    func presentStart(with model: ITCHRecordEditorModel.Local.ITCHRecord?)
}

protocol ITCHRecordEditorRouterLogic {
    func popViewController()
}

protocol ITCHRecordEditorWorker {
    func addRecord(
        for token: String,
        with id: Int,
        model: ITCHRecordEditorModel.Network.ITCHRecord,
        completion: ((Result<String?, Error>) -> Void)?
    )
    
    func deleteRecord(
        for token: String,
        with id: Int,
        completion: ((Result<String?, Error>) -> Void)?
    )
    
    func changeRecord(
        for token: String,
        with id: Int,
        model: ITCHRecordEditorModel.Network.ITCHRecord,
        completion: ((Result<String?, Error>) -> Void)?
    )
}
