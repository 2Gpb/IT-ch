//
//  ITCHHomeWorkEditorInteractor.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import ITCHCore
import Foundation
import ITCHNetworking

final class ITCHHomeWorkEditorInteractor: ITCHHomeWorkEditorBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic
    private let homeWork: ITCHHomeWorkEditorModel.Local.ITCHHomeWork?
    private let id: Int
    private let networkService: ITCHHomeWorkEditorWorker
    private let secureService: ITCHSecureSessionLogic
    
    // MARK: - Lifecycle
    init(
        for id: Int,
        presenter: ITCHHomeWorkEditorPresentationLogic & ITCHHomeWorkEditorRouterLogic,
        with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork? = nil,
        networkService: ITCHHomeWorkEditorWorker,
        secureService: ITCHSecureSessionLogic
    ) {
        self.id = id
        self.presenter = presenter
        self.homeWork = model
        self.networkService = networkService
        self.secureService = secureService
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: homeWork)
    }
    
    func loadAddHomeWork(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork) {
        guard let tokensModel = secureService.get() else { return }
        networkService.addHomeWork(
            for: tokensModel.token,
            with: id,
            model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork(
                title: model.title,
                deadline: model.date,
                refToHomework: model.linkOnTask,
                refToSubmitForm: model.linkForLoad,
                refToSolutionView: model.linkForCheck
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
    
    func loadChangeHomeWork(with model: ITCHHomeWorkEditorModel.Local.ITCHHomeWork) {
        guard let tokensModel = secureService.get() else { return }
        networkService.changeHomeWork(
            for: tokensModel.token,
            with: homeWork?.id ?? 0,
            model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork(
                title: model.title,
                deadline: model.date,
                refToHomework: model.linkOnTask,
                refToSubmitForm: model.linkForLoad,
                refToSolutionView: model.linkForCheck
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
