//
//  ITCHRecordEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import ITCHCore
import Foundation
import ITCHUtilities
import ITCHNetworking

final class ITCHRecordEditorInteractor: ITCHRecordEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic
    private let record: ITCHRecordEditorModel.Local.ITCHRecord?
    private let networkService: ITCHRecordEditorWorker
    private let secureService: ITCHSecureSessionLogic
    private let id: Int
    
    // MARK: - Lifecycle
    init(
        for id: Int,
        presenter: ITCHRecordEditorPresentationLogic & ITCHRecordEditorRouterLogic,
        with model: ITCHRecordEditorModel.Local.ITCHRecord? = nil,
        networkService: ITCHRecordEditorWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.id = id
        self.presenter = presenter
        self.record = model
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: record)
    }
    
    func loadAddRecord(date: String, videoURL: String) {
        guard let tokensModel = secureService.get() else { return }
        
        networkService.addRecord(
            for: tokensModel.token,
            with: id,
            model: ITCHRecordEditorModel.Network.ITCHRecord(
                title: date,
                refToVideo: videoURL
            ),
            completion: { [weak self] result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.presenter.popViewController()
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        )
    }
    
    func loadDeleteRecord() {
        guard let tokensModel = secureService.get() else { return }
        networkService.deleteRecord(
            for: tokensModel.token,
            with: record?.id ?? 0,
            completion: { [weak self] result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.presenter.popViewController()
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        )
    }
    
    func loadChangeRecord(date: String, videoURL: String) {
        guard let record, let tokensModel = secureService.get() else { return }
        
        networkService.changeRecord(
            for: tokensModel.token,
            with: record.id,
            model: ITCHRecordEditorModel.Network.ITCHRecord(
                title: date,
                refToVideo: videoURL
            ),
            completion: { [weak self] result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self?.presenter.popViewController()
                    }
                case .failure(let error):
                    if let error = error as? ITCHErrorResponse {
                        print(error.message)
                    } else {
                        print(error.localizedDescription)
                    }
                }
            }
        )
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
