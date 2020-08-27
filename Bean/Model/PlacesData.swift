//
//  PlacesData.swift
//  Bean
//
//  Created by William Ho on 2020-08-25.
//  Copyright © 2020 William Ho. All rights reserved.
//

import Foundation

struct PlacesData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let name: String
    let rating: Double
    let vicinity: String
    let place_id: String
}


