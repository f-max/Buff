//
//  Image.swift
//
//  Copyright © 2021 Massimiliano Faustini. All rights reserved.
//

import Foundation

final class Image {
    let id: String
    let key: String
    let url: String
    let imageData: Data?
    
    public init(id: String, key: String, url: String, imageData: Data? = nil) {
        self.id = id
        self.key = key
        self.url = url
        self.imageData = imageData
    }
    
    convenience init(image: BuffResponse.Image) {
        self.init(id: image.id,
                  key: image.key,
                  url: image.url,
                  imageData: nil)
    }
}
