//
//  ITCHHomeWorksPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

final class ITCHHomeWorksPresenter: ITCHHomeWorksPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHomeWorksViewController?
}

// MARK: - RouterLogic
extension ITCHHomeWorksPresenter: ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork() {
        view?.present(ITCHHomeWorkEditorAssembly.build(), animated: true)
    }
    
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?) {
        view?.present(ITCHHomeWorkEditorAssembly.build(with: model), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
