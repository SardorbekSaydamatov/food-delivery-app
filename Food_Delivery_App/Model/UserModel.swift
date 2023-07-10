//
//  UserModel.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 29/05/23.
//

import Foundation
import FirebaseFirestore

struct UserModel {
    let id: String
    let firstName: String
    let email: String
    
    init(id: String, firstName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.email = email
    }
}
