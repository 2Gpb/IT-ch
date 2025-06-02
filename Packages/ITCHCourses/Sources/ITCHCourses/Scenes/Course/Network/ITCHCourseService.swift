//
//  ITCHCourseService.swift
//  ITCHCourses
//
//  Created by Peter on 02.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHCourseService: ITCHCourseWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func fetchCourse(
        for token: String,
        with id: Int,
        completion: ((Result<ITCHCurrentCourseModel.Network.ITCHCourse?, Error>) -> Void)?
    ) {
        let endpoint = ITCHCourseEndpoint.course(token: token, id: id)
        
        fetch(request: ITCHRequest(endpoint: endpoint), completion: completion)
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
                    let data = serverResponse.data,
                    !data.isEmpty
                else {
                    completion?(
                        .failure(
                            ITCHErrorResponse(
                                status: -1,
                                error: "",
                                message: "data error"
                            )
                        )
                    )
                    
                    return
                }

                do {
                    let decoded = try self.decoder.decode(T.self, from: data)
                    completion?(.success(decoded))
                } catch let error {
                    completion?(.failure(error))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
