//
//  ITCHMembersProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 13.05.2025.
//

import UIKit

protocol ITCHMembersBusinessLogic: UITableViewDataSource {
    func loadStart()
    func loadAddMembers()
    func loadDismiss()
}

protocol ITCHMembersPresentationLogic {
    func presentStart()
    func presentChangeRoleAlert()
}

protocol ITCHMembersRouterLogic {
    func routeToAddMembers(with id: Int, actionOnDismiss: (() -> Void)?)
    func popViewController()
}

protocol ITCHMembersWorker {
    func fetchMembers(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHMembersModel.Network.ITCHMember]?, Error>) -> Void)?
    )
    
    func deleteCourse(
        for token: String,
        courseId: Int,
        userId: Int,
        completion: ((Result<String?, Error>) -> Void)?
    )
}
