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
    func presentStart(for role: ITCHCourseUserRole) {
        view?.displayStart(for: role)
    }
    
    func presentHomeWorks(isEmpty: Bool) {
        view?.displayHomeWorks(isEmpty: isEmpty)
    }
}

// MARK: - RouterLogic
extension ITCHHomeWorksPresenter: ITCHHomeWorksRouterLogic {
    func routeToAddHomeWork(with id: Int, actionOnDismiss: (() -> Void)?) {
        view?.present(ITCHHomeWorkEditorAssembly.build(for: id, actionOnDismiss: actionOnDismiss), animated: true)
    }
    
    func routeToOpen(with link: String?) {
        link?.openURL()
    }
    
    func routeToSolutions(with link: String?) {
        link?.openURL()
    }
    
    func routeToEditHomeWork(
        for id: Int,
        with model: ITCHHomeWorksModel.Local.ITCHHomeWork?,
        actionOnDismiss: (() -> Void)?
    ) {
        view?.present(
            ITCHHomeWorkEditorAssembly.build(
                for: id,
                with: ITCHHomeWorkEditorModel.Local.ITCHHomeWork(
                    id: model?.id ?? 0,
                    title: model?.title ?? "",
                    date: model?.date ?? "",
                    linkOnTask: model?.linkOnTask ?? "",
                    linkForCheck: model?.linkForCheck,
                    linkForLoad: model?.linkForLoad
                ),
                actionOnDismiss: actionOnDismiss
            ),
            animated: true
        )
    }
    
    func popViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}
