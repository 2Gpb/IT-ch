//
//  ITCHSignUpPasswordService.swift
//  ITCHAuthorization
//
//  Created by Peter on 31.05.2025.
//

import Foundation
import ITCHNetworking

final class ITCHSignUpPasswordService: ITCHSignUpPasswordWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func sendPassword(
        with model: ITCHSignUpPassword.Network.ITCHDTOPassword,
        completion: ((Result<ITCHTokenResponse?, Error>) -> Void)?
    ) {
        let endpoint = ITCHSignUpPasswordEndpoint.sendPassword
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
                guard let self, let data = serverResponse.data else {
                    completion?(.success(nil))
                    return
                }
                
                do {
                    let model = try decoder.decode(T.self, from: data)
                    completion?(.success(model))
                } catch {
                    do {
                        let error = try decoder.decode(ITCHErrorResponse.self, from: data)
                        completion?(.failure(error))
                    } catch {
                        completion?(.failure(ITCHErrorResponse(
                            status: -1,
                            error: "Decode error",
                            message: error.localizedDescription
                        )))
                    }
                }
                
            case .failure(let error):
                completion?(.failure(ITCHErrorResponse(
                    status: -1,
                    error: "Network error",
                    message: error.localizedDescription
                )))
            }
        }
    }
}
