//
//  CatBreedsEndpont.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

struct BuffEndpoint: Endpoint {
    let httpMethod: HttpMethods
    let url: URL
    var headers: [String: String]?
    let body: String?
    let requiresAuthentication: Bool
    
    init(buffId: Int) {
        var components = URLComponents()
        components.scheme = APIConstants.buffApiScheme
        components.host = APIConstants.buffApiHost
        components.path = APIConstants.buffApiPathComponent + "/\(buffId)"
        guard let url = components.url else {
            assert(false)
        }
        self.httpMethod = .GET
        self.url = url
        self.body = nil
        self.headers = nil
        self.requiresAuthentication = false
    }
}
