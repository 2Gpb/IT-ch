//
//  ITCHScheduleService.swift
//  ITCHCourses
//
//  Created by Peter on 01.06.2025.
//

import Foundation
import ITCHNetworking

final class ITCHScheduleService: ITCHScheduleWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func sendCourseInfo(
        for token: String,
        model: ITCHCreateCourseModel.Network.ITCHDTOCreateCourse,
        completion: ((Result<Void?, Error>) -> Void)?
    ) {
        let endpoint = ITCHScheduleEndpoint.createCourse(token: token)
        let body = try? encoder.encode(model)

        fetch(
            request: ITCHRequest(endpoint: endpoint, method: .post, body: body),
            completion: completion
        )
    }
    
    // MARK: - Private methods
    private func fetch(
        request: ITCHRequest,
        completion: ((Result<Void?, Error>) -> Void)?
    ) {
        networking.execute(with: request) { [weak self] response in
            switch response {
            case .success(let serverResponse):
                guard
                    self != nil,
                    serverResponse.data != nil
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
                
                let response = serverResponse.response as? HTTPURLResponse
                if let status = response?.statusCode, (200...299).contains(status) {
                    completion?(.success(nil))
                } else {
                    completion?(.failure(ITCHErrorResponse(
                        status: -1,
                        error: "Error",
                        message: "No access"
                    )))
                }
                
            case .failure(let error):
                completion?(.failure(ITCHErrorResponse(
                    status: -1,
                    error: "Error",
                    message: "Network error " + error.localizedDescription
                )))
            }
        }
    }
}
