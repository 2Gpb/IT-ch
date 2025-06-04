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
    
    func changeSchedule(
        for token: String,
        with id: Int,
        model: ITCHScheduleEditorModel.Network.ITCHSchedule,
        completion: ((Result<Void?, Error>) -> Void)?
    ) {
        print(model)
        let endpoint = ITCHScheduleEndpoint.changeSchedule(token: token, id: id)
        let body = try? encoder.encode(model)
        
        fetch(request: ITCHRequest(endpoint: endpoint, method: .patch, body: body), completion: completion)
    }
    
    // MARK: - Private methods
    private func fetch(
        request: ITCHRequest,
        completion: ((Result<Void?, Error>) -> Void)?
    ) {
        networking.execute(with: request) { response in
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
                
                completion?(.failure(ITCHErrorResponse(
                    status: -1,
                    error: "",
                    message: "unknown error"
                )))
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
