//
//  Author.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class Author {
    let firstName: String
    let lastName: String
    let image: String
    var imageData: Data?
    
    public init(firstName: String, lastName: String, image: String, imageData: Data? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.imageData = imageData
    }
    
    convenience init(author: BuffResponse.Author) {
        self.init(firstName: author.first_name,
                  lastName: author.last_name,
                  image: author.image)
    }
}

extension Author {
    var fullName: String {
        firstName + " " + lastName
    }
}

extension Author {
    func loadImage(completion: @escaping () -> Void) {
        guard imageData == nil, let url = URL(string: image) else {
            return
        }
        let request =  URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, _ in
            self?.imageData = data
            completion()
        }
        task.resume()
    }
}
