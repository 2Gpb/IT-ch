//
//  ITCHHomeWorksEditorService.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHHomeWorksEditorService: ITCHHomeWorkEditorWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func addHomeWork(
        for token: String,
        with id: Int,
        model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHHomeWorksEditorEndpoint.addHomeWork(token: token, id: id)
        let body = try? encoder.encode(model)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .post, body: body), completion: completion)
    }
    
    func deleteHomeWork(
        for token: String,
        with id: Int,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHHomeWorksEditorEndpoint.deleteHomeWork(token: token, id: id)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .delete), completion: completion)
    }
    
    func changeHomeWork(
        for token: String,
        with id: Int,
        model: ITCHHomeWorkEditorModel.Network.ITCHHomeWork,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHHomeWorksEditorEndpoint.changeHomeWork(token: token, id: id)
        let body = try? encoder.encode(model)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .patch, body: body), completion: completion)
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
                
                if (200...204).contains(httpResponse?.statusCode ?? 0) {
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
