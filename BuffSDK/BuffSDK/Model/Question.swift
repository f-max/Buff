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
    let timeToShow: Int
    
    public init(id: Int, title: String, category: Int, timeToShow: Int) {
        self.id = id
        self.title = title
        self.category = category
        self.timeToShow = timeToShow
    }
    
    convenience init(question: BuffResponse.Question, timeToShow: Int) {
        self.init(id: question.id,
                  title: question.title,
                  category: question.category,
                  timeToShow: timeToShow)
    }
}
