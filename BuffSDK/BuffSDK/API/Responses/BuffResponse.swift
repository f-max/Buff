//
//  BuffResponse.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

struct BuffResponse: Codable {
    let result: Result
    struct Result: Codable {
        let id: Int
        let client_id: Int
        let stream_id: Int
        let time_to_show: Int
        let priority: Int
        let created_at: String
        let author: Author
        let question: Question
        let answers: [Answer]
        let language: String
    }
    struct Author: Codable {
        let first_name: String
        let last_name: String
        let image: String
    }
    struct Question: Codable {
        let id: Int
        let title: String
        let category: Int
    }
    struct Answer: Codable {
        let id: Int
        let buff_id: Int
        let title: String
        let image: [Int: Image]
    }
    struct Image: Codable {
        let id: String
        let key: String
        let url: String
    }
}
