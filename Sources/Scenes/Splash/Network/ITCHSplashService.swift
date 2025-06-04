//
//  ITCHSplashService.swift
//  IT-ch
//
//  Created by Peter on 01.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHSplashService: ITCHSplashWorker {
    // MARK: - Private fiels
    private var networking: ITCHNetworkingLogic
    private let encoder: JSONEncoder = JSONEncoder()
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func checkAccess(
        for token: String,
        completion: ((Result<ITCHErrorResponse?, Error>) -> Void)?
    ) {
        let endpoint = ITCHSplashEndpoint.checkAccess(token: token)
        
        networking.baseUrl = "http://localhost:8081"
        
        fetch(request: ITCHRequest(endpoint: endpoint), completion: completion)
    }
    
    func refreshToken(
        for refreshToken: ITCHRefreshModel.Network.ITCHDTORefresh,
        completion: ((Result<ITCHTokenResponse?, Error>) -> Void)?
    ) {
        let endpoint = ITCHSplashEndpoint.refresh
        let body = try? encoder.encode(refreshToken)
        
        networking.baseUrl = "http://localhost:8080"
        
        fetch(
            request: ITCHRequest(endpoint: endpoint, method: .post, body: body),
            completion: completion
        )
    }
    
    // MARK: - Private methods
    private func fetch<T: Decodable>(
        request: ITCHRequest,
        completion: ((Result<T?, Error>) -> Void)?
    ) {
        networking.execute(with: request) { [weak self] response in
            switch response {
            case .success(let serverResponse):
                guard let self,
                      let data = serverResponse.data else {
                    completion?(.success(nil))
                    return
                }
                
                if let httpResponse = serverResponse.response as? HTTPURLResponse,
                   !(200...299).contains(httpResponse.statusCode) {
                    if let apiError = try? self.decoder.decode(ITCHErrorResponse.self, from: data) {
                        completion?(.failure(apiError))
                    } else {
                        completion?(.failure(ITCHErrorResponse(
                            status: httpResponse.statusCode,
                            error: "Invalid response",
                            message: "access error"
                        )))
                    }
                    
                    return
                }
                
                if let decoded = try? self.decoder.decode(T.self, from: data) {
                    completion?(.success(decoded))
                } else {
                    completion?(.success(nil))
                }
                
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
