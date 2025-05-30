//
//  ITCHNetworking.swift
//  ITCHNetworking
//
//  Created by Peter on 11.02.2025.
//

import Foundation

public protocol ITCHNetworkingLogic {
    typealias Response = ((_ response: Result<ITCHNetworking.ServerResponse, Error>) -> Void)
    
    func execute(with request: ITCHRequest, completion: @escaping Response)
}

public enum ITCHNetworking {
    public struct ServerResponse {
        public let data: Data?
        public let response: URLResponse?
    }
}

public final class ITCHBaseURLWorker: ITCHNetworkingLogic {
    // MARK: - Error
    public enum BaseURLError: Error {
        case invalidRequest
    }
    
    // MARK: - Variables
    public var baseUrl: String
    
    // MARK: - Lifecycle
    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    // MARK: - Methods
    public func execute(with request: ITCHRequest, completion: @escaping Response) {
        guard let urlRequest = convert(request) else {
            completion(.failure(BaseURLError.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            completion(.success(ITCHNetworking.ServerResponse(data: data, response: response)))
        }
        
        task.resume()
    }
    
    // MARK: - Private fields
    private func convert(_ request: ITCHRequest) -> URLRequest? {
        guard let url = generateDestinationURL(for: request) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.endpoint.headers
        urlRequest.httpBody = request.body
        urlRequest.timeoutInterval = request.timeInterval
        
        return urlRequest
    }
    
    private func generateDestinationURL(for request: ITCHRequest) -> URL? {
        guard
            let url = URL(string: baseUrl),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else {
            return nil
        }
        
        let queryItems = request.parameters?.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        components.path += request.endpoint.compositePath
        components.queryItems = queryItems
        
        return components.url
    }
}
