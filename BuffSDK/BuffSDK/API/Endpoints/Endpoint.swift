//
//  Endpoint.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

protocol Endpoint {
    var httpMethod: HttpMethods { get }
    var url: URL { get }
    var headers: [String: String]? { get }
    var body: String? { get }
    var requiresAuthentication: Bool { get }
}

extension URLRequest {
    static func request(endpoint: Endpoint) -> URLRequest {
        var request =  URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body?.data(using: .utf8)
        return request
    }
}
