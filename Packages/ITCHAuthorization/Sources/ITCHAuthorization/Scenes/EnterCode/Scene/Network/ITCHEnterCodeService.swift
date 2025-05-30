//
//  ITCHEnterCodeService.swift
//  ITCHAuthorization
//
//  Created by Peter on 30.05.2025.
//

import Foundation
import ITCHNetworking

enum ITCHCodeRequestType: String {
    case confirm = "/confirm"
    case resend = "/send-code"
}

final class ITCHEnterCodeService {
    // MARK: - Error
    enum NetworkingError: Error {
        case invalidResponse
    }
    
    // MARK: - Fields
    private let baseURL = "http://localhost:8080"
    private var path = ""
    private let encoder: JSONEncoder = JSONEncoder()
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Methods
    func request(
        for type: ITCHCodeRequestType,
        with model: ITCHEnterCode.Network.ITCHDTOCode
    ) async throws -> ITCHErrorResponse? {
        path = type.rawValue
        
        let request = try makeRequest(with: model)
        return try await sendRequest(request)
    }
    
    // MARK: - Private methods
    private func makeRequest(with model: ITCHEnterCode.Network.ITCHDTOCode) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkingError.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(model)
        return request
    }
    
    private func sendRequest(_ request: URLRequest) async throws -> ITCHErrorResponse? {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse
        }
        
        if (200..<300).contains(httpResponse.statusCode) {
            return nil
        } else {
            return try decoder.decode(ITCHErrorResponse.self, from: data)
        }
    }
}
