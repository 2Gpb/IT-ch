//
//  ITCHRequest.swift
//  ITCHNetworking
//
//  Created by Peter on 11.02.2025.
//

import Foundation

public struct ITCHRequest {
    public enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
        case options = "OPTIONS"
    }
    
    public var endpoint: ITCHEndpoint
    public var method: Method
    public var parameters: [String: String]?
    public var timeInterval: TimeInterval
    public let body: Data?
    
    public init(
        endpoint: ITCHEndpoint,
        method: Method = .get,
        parameters: [String: String]? = nil,
        body: Data? = nil,
        timeInterval: TimeInterval = 5
    ) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.timeInterval = timeInterval
        self.body = body
        
        if var endpointParameters = endpoint.parameters {
            for (key, value) in parameters ?? [:] {
                endpointParameters[key] = value
            }
            
            self.parameters = endpointParameters
        }
    }
}
