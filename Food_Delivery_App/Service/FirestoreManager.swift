//
//  FirestoreManager.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 11/05/23.
//

import Firebase
import FirebaseFirestore

struct WhereCriteria {
    var criteria: String
    var field: String
    var operation: String
}

class FirestoreManager {
    static let shared = FirestoreManager()
    
    private let db = Firestore.firestore()
    
    private init() {}
    
    // Add your Firestore methods here
    
    func getAllDocuments(completion: @escaping ([DocumentSnapshot]?, Error?) -> Void, collection: String) {
        // Example method to fetch data from Firestore
        db.collection(collection).getDocuments { (snapshot, error) in
            completion(snapshot?.documents, error)
        }
    }
    
    func getDocById(completion: @escaping (DocumentSnapshot, Error?) -> Void, id: String, collection: String) {
        let docRef = db.collection(collection).document(id)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                completion(document, error)
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func getDocByWhereQuery(completion: @escaping (DocumentSnapshot, Error?) -> Void, collection: String, whereCriteria: WhereCriteria) {
        db.collection(collection).whereField(whereCriteria.field, isEqualTo: whereCriteria.criteria)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        completion(document, err)
                        
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
}
