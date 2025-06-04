//
//  ITCHAddMembersProtocols.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit

protocol ITCHAddMembersBusinessLogic: UITableViewDataSource {    
    func loadStart()
    func selectedMember(at row: Int)
    func loadAddMembers()
    func loadDismiss()
}

protocol ITCHAddMembersPresentationLogic {
    func presentStart()
}

protocol ITCHAddMembersRouterLogic {
    func popViewController()
}

protocol ITCHAddMembersWorker {
    func fetchAllMembers(
        for token: String,
        completion: ((Result<[ITCHAddMembersModel.Network.ITCHMember]?, Error>) -> Void)?
    )
    
    func sendSelectedMembers(
        for token: String,
        with id: Int,
        selectedMembersIds: ITCHAddMembersModel.Network.ITCHAddedMembers,
        completion: ((Result<String?, Error>) -> Void)?
    )
}
