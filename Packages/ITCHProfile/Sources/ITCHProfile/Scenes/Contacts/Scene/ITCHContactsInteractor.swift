//
//  ITCHContactsInteractor.swift
//  ITCHProfile
//
//  Created by Peter on 03.05.2025.
//

import UIKit

final class ITCHContactsInteractor: NSObject, ITCHContactsBusinessLogic {
    // MARK: - Private fields
    private let presenter: ITCHContactsPresentationLogic & ITCHContactsRouterLogic
    private let contacts: [ITCHContacts] = ITCHContacts.allCases
    
    // MARK: - Lifecycle
    init(presenter: ITCHContactsPresentationLogic & ITCHContactsRouterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    func loadDismiss() {
        presenter.popViewController()
    }
    
    func loadSocial(with index: Int) {
        let social = contacts[index]
        switch social {
        case .vk:
            presenter.routeToVK()
        case .telegram:
            presenter.routeToTelegram()
        case .email:
            presenter.routeToEmail()
        }
    }
}

// MARK: - UITableViewDataSource
extension ITCHContactsInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ITCHContactsCell.reuseId
        ) as? ITCHContactsCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: contacts[indexPath.row].title, image: contacts[indexPath.row].image)
        
        return cell
    }
}
