//
//  APIClient.swift
//  VTVGoTV
//

import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ endpoint: String) async throws -> T
}

final class APIClient: APIClientProtocol {
    func request<T: Decodable>(_ endpoint: String) async throws -> T {
        fatalError("Not implemented")
    }
}
