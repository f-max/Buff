//
//  Answer.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class Answer {
    let id: Int
    let title: String
    let buffId: Int
    let image: [Int: Image]
    
    public init(id: Int, title: String, buffId: Int, image: [Int: Image]) {
        self.id = id
        self.title = title
        self.buffId = buffId
        self.image = image
    }
    
    convenience init(answer: BuffResponse.Answer) {
        let mappedImage = answer.image.mapValues {
             Image(image: $0)
        }
        self.init(id: answer.id,
                  title: answer.title,
                  buffId: answer.buff_id,
                  image: mappedImage)
    }
}
