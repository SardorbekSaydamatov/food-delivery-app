//
//  ProductViewModel.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 16/05/23.
//

//import Foundation
//import FirebaseFirestore
//
//class userViewModel: ObservableObject {
//
//    @Published var products = [Product]()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//        db.collection("products").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.products = documents.map { (queryDocumentSnapshot) -> Product in
//                let data = queryDocumentSnapshot.data()
//                let name = data["name"] as? String ?? ""
//                let images = data["images"] as? [String] ?? [
//                let price = data["price"] as? Int ?? 0
//                return Product(name: name, images: images, price: price)
//            }
//        }
//    }
//}
