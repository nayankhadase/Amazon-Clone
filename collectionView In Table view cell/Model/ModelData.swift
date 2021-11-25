//
//  ModelData.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation

struct ModelData: Codable {
    let response: [ProductData]?
}

struct ProductData: Codable {
    let category_name: String?
    let products: [Products]?
}

struct Products: Codable {
    let name: String?
    let image_name: String?
    let price: String?
    let description: String?
}
