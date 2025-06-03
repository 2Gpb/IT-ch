//
//  ITCHAddMembersService.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHAddMembersService: ITCHAddMembersWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let encoder: JSONEncoder = JSONEncoder()
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func fetchAllMembers(
        for token: String,
        completion: ((Result<[ITCHAddMembersModel.Network.ITCHMember]?, Error>) -> Void)?
    ) {
        let endpoint = ITCHAddMembersEndpoint.allMembers(token: token)
        
        fetch(request: ITCHRequest(endpoint: endpoint), completion: completion)
    }
    
    func sendSelectedMembers(
        for token: String,
        with id: Int,
        selectedMembersIds: ITCHAddMembersModel.Network.ITCHAddedMembers,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHAddMembersEndpoint.addMembers(token: token, id: id)
        let body = try? encoder.encode(selectedMembersIds)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .post, body: body), completion: completion)
    }
    
    // MARK: - Private methods
    private func fetch<T: Decodable>(
        request: ITCHRequest,
        completion: ((Result<T?, Error>) -> Void)?
    ) {
        networking.execute(with: request) { [weak self] response in
            switch response {
            case .success(let serverResponse):
                let httpResponse = serverResponse.response as? HTTPURLResponse
                
                if httpResponse?.statusCode == 201 {
                    completion?(.success(nil))
                    return
                }

                if httpResponse?.statusCode == 403 {
                    completion?(.failure(ITCHErrorResponse(
                        status: -1,
                        error: "Error",
                        message: "No access"
                    )))
                    return
                }
                
                guard let data = serverResponse.data, !data.isEmpty else {
                    completion?(.failure(ITCHErrorResponse(
                        status: -1,
                        error: "Error",
                        message: "Data is empty"
                    )))
                    return
                }
                
                do {
                    let decoded = try self?.decoder.decode(T.self, from: data)
                    completion?(.success(decoded))
                } catch {
                    completion?(.failure(error))
                }
                
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
