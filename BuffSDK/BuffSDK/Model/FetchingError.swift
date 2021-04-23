//
//  FetchingError.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

enum FetchingError: Error {
    public struct ErrorMessages {
        let userFacingMessage: String?
        let debugMessage: String?
        public init(userFacingMessage: String?, debugMessage: String?) {
            self.userFacingMessage = userFacingMessage
            self.debugMessage = debugMessage
        }
    }
    case invalidResponse(errorMessages: ErrorMessages?)
    case noData(errorMessages: ErrorMessages?)
    case parsingError(errorMessages: ErrorMessages?)
}
