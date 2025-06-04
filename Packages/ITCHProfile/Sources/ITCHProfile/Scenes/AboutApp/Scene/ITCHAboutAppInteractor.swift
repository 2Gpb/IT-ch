//
//  ITCHAboutAppInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHAboutAppInteractor: NSObject, ITCHAboutAppBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHAboutAppPresentationLogic & ITCHAboutAppRouterLogic
    private let pages: [ITCHAboutAppPages] = ITCHAboutAppPages.allCases
    
    // MARK: - Lifecycle
    init(presenter: ITCHAboutAppPresentationLogic & ITCHAboutAppRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadPage(with index: Int) {
        let page = pages[index]
        switch page {
        case .faq:
            presenter.routeToFAQ()
        case .privacy:
            presenter.routeToPrivacyPolicy()
        case .evaluate:
            presenter.routeToEvaluateApp()
        }
    }
}

extension ITCHAboutAppInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rawCell = tableView.dequeueReusableCell(withIdentifier: ITCHAboutAppCell.reuseId, for: indexPath)
        guard let cell = rawCell as? ITCHAboutAppCell else {
            return rawCell
        }
        
        cell.configure(with: pages[indexPath.row].title)
        
        return cell
    }
}
