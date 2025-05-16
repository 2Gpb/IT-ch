//
//  ITCHAddMembersProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHAddMembersBusinessLogic: UITableViewDataSource {
    func loadDismiss()
}

protocol ITCHAddMembersPresentationLogic { }

protocol ITCHAddMembersRouterLogic {
    func popViewController()
}
