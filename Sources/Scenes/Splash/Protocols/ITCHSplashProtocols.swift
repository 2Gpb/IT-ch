//
//  ITCHSplashProtocols.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import ITCHNetworking

protocol ITCHSplashBusinessLogic {
    func checkAuth()
}

protocol ITCHSplashPresentationLogic { }

protocol ITCHSplashRouterLogic {
    func routeToAuth()
    func routeToCourses()
}

protocol ITCHSplashWorker {
    func checkAccess(
        for token: String,
        completion: ((Result<ITCHErrorResponse?, Error>) -> Void)?
    )
    
    func refreshToken(
        for refreshToken: ITCHRefreshModel.Network.ITCHDTORefresh,
        completion: ((Result<ITCHTokenResponse?, Error>) -> Void)?
    )
}
