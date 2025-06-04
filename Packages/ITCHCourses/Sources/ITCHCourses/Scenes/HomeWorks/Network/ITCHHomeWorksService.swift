//
//  ITCHHomeWorksService.swift
//  ITCHCourses
//
//  Created by Peter on 03.06.2025.
//

import Foundation
import ITCHNetworking
import ITCHUtilities

final class ITCHHomeWorksService: ITCHHomeWorksWorker {
    // MARK: - Private fiels
    private let networking: ITCHNetworkingLogic
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Lifecycle
    init(networking: ITCHNetworkingLogic) {
        self.networking = networking
    }
    
    // MARK: - Methods
    func fetchStudentHomeWorks(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHHomeWorksModel.Network.ITCHHomeWorkStudent]?, Error>) -> Void)?
    ) {
        let endpoint = ITCHHomeWorksEndpoint.homeWorksStudent(token: token, id: id)
        
        fetch(request: ITCHRequest(endpoint: endpoint), completion: completion)
    }
    
    func fetchTeacherHomeWorks(
        for token: String,
        with id: Int,
        completion: ((Result<[ITCHHomeWorksModel.Network.ITCHHomeWorkTeacher]?, Error>) -> Void)?
    ) {
        let endpoint = ITCHHomeWorksEndpoint.homeWorksTeacher(token: token, id: id)
        
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
                let httpResponse = serverResponse.response as? HTTPURLResponse
                
//                if httpResponse?.statusCode == 200 {
//                    completion?(.success(nil))
//                    return
//                }
                
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
                    print(1)
                    completion?(.failure(error))
                }
                
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
