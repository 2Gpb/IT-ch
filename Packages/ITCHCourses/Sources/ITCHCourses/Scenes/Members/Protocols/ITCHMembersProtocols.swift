//
//  ITCHMembersProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit

protocol ITCHMembersBusinessLogic: UITableViewDataSource {
    func loadAddMembers()
    func loadDismiss()
}

protocol ITCHMembersPresentationLogic {
    func presentChangeRoleAlert()
}

protocol ITCHMembersRouterLogic {
    func routeToAddMembers()
    func popViewController()
}
