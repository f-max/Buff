//
//  Fetcher.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

class Fetcher {
    func fetch<T: Codable>(endpoint: Endpoint, responseType: T.Type, searchString: String, completion: @escaping (Result<T, FetchingError>) -> Void) {
        assertionFailure("use a subclass instead")
    }
}

final class RealFetcher: Fetcher {
    override func fetch<T: Codable>(endpoint: Endpoint, responseType: T.Type, searchString: String, completion: @escaping (Result<T, FetchingError>) -> Void) {
        let request = URLRequest.request(endpoint: endpoint)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let validatedResult = ResponseValidator.validate(data: data, response: response, error: error)

            switch validatedResult {
            case .failure(let error):
                completion(.failure(error))
                return
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch let parsingError {
                    completion(.failure(.parsingError(errorMessages: FetchingError.ErrorMessages(userFacingMessage: nil, debugMessage: "unable to build model object: /n \(parsingError.localizedDescription)"))))
                }
            }
        }
        task.resume()
    }
}

internal final class MockFetcher<T>: Fetcher {
    var result: Result<T, FetchingError>
    init(result: Result<T, FetchingError>) {
        self.result = result
    }
    override func fetch<T: Codable>(endpoint: Endpoint, responseType: T.Type, searchString: String, completion: @escaping (Result<T, FetchingError>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let result = self.result as? Result<T, FetchingError> {
                completion(result)
            }
        }
    }
}
