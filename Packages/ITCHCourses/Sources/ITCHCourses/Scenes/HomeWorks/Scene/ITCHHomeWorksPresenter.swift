//
//  ITCHHomeWorksPresenter.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import ITCHUtilities

final class ITCHHomeWorksPresenter: ITCHHomeWorksPresentationLogic {
    // MARK: - Variables
    weak var view: ITCHHomeWorksViewController?
        
    // MARK: - Methods
    func presentStart(for role: ITCHCourseUserRole, isEmpty: Bool) {
        view?.displayStart(for: role, isEmpty: isEmpty)
    }
}

// MARK: - RouterLogic
extension ITCHHomeWorksPresenter: ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork() {
        view?.present(ITCHHomeWorkEditorAssembly.build(), animated: true)
    }
    
    func routeToOpen(with link: String?) {
        link?.openURL()
    }
    
    func routeToSolutions(with link: String?) {
        link?.openURL()
    }
    
    func routeToEditHomeWork(with model: ITCHHomeWorkModel?) {
        view?.present(ITCHHomeWorkEditorAssembly.build(with: model), animated: true)
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
