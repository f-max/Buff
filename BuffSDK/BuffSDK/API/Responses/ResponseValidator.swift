//
//  ResponseValidator.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class ResponseValidator {
    static func validate(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, FetchingError> {
        
        guard let responseWithCode = response as? HTTPURLResponse,
              (200..<300).contains(responseWithCode.statusCode),
              error == nil else {
            return .failure(.invalidResponse(errorMessages: FetchingError.ErrorMessages(userFacingMessage: nil, debugMessage: error?.localizedDescription)))
        }
        guard let data = data, data.count > 0 else {
            return .failure(.noData(errorMessages: FetchingError.ErrorMessages(userFacingMessage: nil, debugMessage: "valid response, but no data")))
        }
        return .success(data)
    }
}
