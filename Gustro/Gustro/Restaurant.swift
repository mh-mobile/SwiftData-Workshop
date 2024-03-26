//
//  Restaurant.swift
//  Gustro
//
//  Created by mh on 2024/03/26.
//

import SwiftData

@Model
class Restaurant {
    
    init(name: String, priceRating: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.priceRating = priceRating
        self.qualityRating = qualityRating
        self.speedRating = speedRating
    }
    
    var name: String
    var priceRating: Int
    var qualityRating: Int
    var speedRating: Int
}
