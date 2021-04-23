//
//  Constants.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

enum APIConstants {
    static let buffApiScheme = "https"
    static let buffApiHost = "demo2373134.mockable.io"
    static let buffApiPathComponent = "/buffs"
}

enum HttpMethods: String {
    case `DELETE`
    case `GET`
    case `PATCH`
    case `POST`
    case `PUT`
}
