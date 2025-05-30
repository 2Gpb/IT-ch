//
//  ITCHSignUpService.swift
//  ITCHAuthorization
//
//  Created by Peter on 24.05.2025.
//

import Foundation
import ITCHNetworking

final class ITCHSignUpService: ITCHSignUpWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func sendUserInfo(
        with model: ITCHSignUp.Network.ITCHDTOFullName,
        completion: ((Result<ITCHErrorResponse?, Error>) -> Void)?
    ) {
        let endpoint = ITCHSignUpEndpoint.sendCode
        let body = try? encoder.encode(model)
        
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
                guard
                    let self,
                    let data = serverResponse.data
                else {
                    completion?(.success(nil))
                    return
                }
                
                do {
                    if data.isEmpty {
                        completion?(.success(nil))
                    } else {
                        let decoded = try self.decoder.decode(T.self, from: data)
                        completion?(.success(decoded))
                    }
                } catch {
                    completion?(.failure(error))
                }
                
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
