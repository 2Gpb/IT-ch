//
//  ITCHRecordEditorProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

protocol ITCHRecordEditorBusinessLogic {
    func loadStart()
    func loadAddRecord(date: String, videoURL: String)
    func loadDismiss()
}

protocol ITCHRecordEditorPresentationLogic {
    func presentStart(with model: ITCHRecordModel?)
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
}
