//
//  ProductModel.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 16/05/23.
//

import Foundation


struct Product: Identifiable{
    var id: String
    var name: String
    var images: [String]
    var price: Int
    var category: String
    
    init(id: String, name: String, images: [String], price: Int, category: String) {
        self.id = id
        self.name = name
        self.images = images
        self.price = price
        self.category = category
    }
}
