//
//  Quiz.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class Quiz {
    let id: Int
    let clientId: Int
    let stream_id: Int
    let timeToShow: Int
    let priority: Int
    let createdAt: String
    let language: String
    let author: Author
    let question: Question
    let answers: [Answer]
    
    public init(id: Int, clientId: Int, streamId: Int, timeToShow: Int, priority: Int, createdAt: String, language: String, author: Author, question: Question, answers: [Answer]) {
        self.id = id
        self.clientId = clientId
        self.stream_id = streamId
        self.timeToShow = timeToShow
        self.priority = priority
        self.createdAt = createdAt
        self.language = language
        self.author = author
        self.question = question
        self.answers = answers
    }
    
    convenience init(result: BuffResponse.Result) {
        self.init(id: result.id,
                  clientId: result.client_id,
                  streamId: result.stream_id,
                  timeToShow: result.time_to_show,
                  priority: result.priority,
                  createdAt: result.created_at,
                  language: result.language,
                  author: Author(author: result.author),
                  question: Question(question: result.question),
                  answers: result.answers.map {Answer(answer: $0)})
    }
}
