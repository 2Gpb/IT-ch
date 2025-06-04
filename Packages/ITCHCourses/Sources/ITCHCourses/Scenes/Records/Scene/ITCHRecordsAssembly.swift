//
//  ITCHRecordsAssembly.swift
//  ITCHCourses
//
//  Created by Peter on 14.05.2025.
//

import UIKit
import ITCHUtilities
import ITCHNetworking
import ITCHCore

final class ITCHRecordsAssembly {
    static func build(with id: Int, for role: ITCHCourseUserRole) -> UIViewController {
        let worker = ITCHBaseURLWorker(baseUrl: "http://localhost:8081")
        let networkService = ITCHRecordService(networking: worker)
        let secureService = ITCHSecureSessionService()
        let presenter = ITCHRecordsPresenter()
        let interactor = ITCHRecordsInteractor(
            presenter: presenter,
            with: id,
            for: role,
            networkService: networkService,
            secureService: secureService
        )
        
        let view = ITCHRecordsViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
