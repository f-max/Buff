//
//  QuizFetcher.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class RealQuizFetcher {
    var fetcher: Fetcher = RealFetcher()
    
    func fetch(quizId: Int, completion: @escaping (Result<BuffResponse, FetchingError>) -> Void) {
        fetcher.fetch(endpoint: BuffEndpoint(buffId: quizId), responseType: BuffResponse.self,
                      searchString: "\(quizId)") { decodedResult in
            switch decodedResult {
            case .failure(let error):
                completion(.failure(error))
                return
            case .success(let data): 
                completion(.success(data))
            }
        }
    }
}

final class MockQuizFetcher {

    func fetchQuiz(searchString: String?, completion: (Result<BuffResponse, FetchingError>) -> Void) {
        assertionFailure("to be implemented")
    }
}
