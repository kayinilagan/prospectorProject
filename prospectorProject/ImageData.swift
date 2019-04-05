//
//  ImageData.swift
//  CollectionViewSlantedLayout-iOS11.4
//
//  Created by period3 on 4/5/19.
//

import Foundation

class ImageData: Codable {
    var image : Data
    var like: Bool
    var text: String
    
    init(image: Data, like: Bool, text: String) {
        self.image = image
        self.like = like
        self.text = text
    }
}
