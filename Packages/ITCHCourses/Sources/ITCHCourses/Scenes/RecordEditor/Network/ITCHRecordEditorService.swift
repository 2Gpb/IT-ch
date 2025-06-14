//
//  ITCHRecordEditorService.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHRecordEditorService: ITCHRecordEditorWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func addRecord(
        for token: String,
        with id: Int,
        model: ITCHRecordEditorModel.Network.ITCHRecord,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHRecordEditorEndpoint.addRecord(token: token, id: id)
        let body = try? encoder.encode(model)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .post, body: body), completion: completion)
    }
    
    func deleteRecord(
        for token: String,
        with id: Int,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHRecordEditorEndpoint.deleteRecord(token: token, id: id)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .delete), completion: completion)
    }
    
    func changeRecord(
        for token: String,
        with id: Int,
        model: ITCHRecordEditorModel.Network.ITCHRecord,
        completion: ((Result<String?, Error>) -> Void)?
    ) {
        let endpoint = ITCHRecordEditorEndpoint.changeRecord(token: token, id: id)
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
