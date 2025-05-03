//
//  ITCHInfoInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

final class ITCHInfoInteractor: ITCHInfoBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHInfoPresentationLogic & ITCHInfoRouterLogic
    private let infoModel: ITCHInfoModel
    
    // MARK: - Lifecycle
    init(
        presenter: ITCHInfoPresentationLogic & ITCHInfoRouterLogic,
        model: ITCHInfoModel
    ) {
        self.presenter = presenter
        self.infoModel = model
    }
    
    // MARK: - Methods
    func loadStart() {
        presenter.presentStart(with: infoModel)
    }
    
    func loadDismiss() {
        presenter.popViewController()
    }
}
