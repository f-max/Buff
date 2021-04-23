//
//  Question.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class Question {
    let id: Int
    let title: String
    let category: Int
    
    public init(id: Int, title: String, category: Int) {
        self.id = id
        self.title = title
        self.category = category
    }
    
    convenience init(question: BuffResponse.Question) {
        self.init(id: question.id,
                  title: question.title,
                  category: question.category)
    }
}
