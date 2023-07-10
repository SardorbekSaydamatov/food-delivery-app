
//  AuthModel.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 10/05/23.


import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var authError: String?
    @Published var categories: [String]?
    @Published var products: [Product]?
    @Published var isLoading = false
    @Published var currentName: UserModel?
    @Published var email: String?
    
    var user: User? {
        didSet {
            objectWillChange.send()

        }
    }
    
    // MARK: Fetch company document
    func fetchProducts(company: String) async throws -> [Product] {
        let querySnapshot = try await Firestore.firestore()
            .collection("products") // Replace with your collection name
            .getDocuments()

        let products = querySnapshot.documents.compactMap { document -> Product? in
            guard let id = document.documentID as? String,
                  let name = document["title"] as? String,
                  let images = document["images"] as? [String],
                  let price = document["price"] as? Int,
                  let category = document["category"] as? String
            else {
                return nil
            }
  
            return Product(id: id, name: name, images: images, price: price, category: category)
        }

        return products
    }
    
    // MARK: Fetch company document
    func fetchCompany(id: String) async throws -> CompanyModel {
        let querySnapshot = try await Firestore.firestore()
            .collection("company") // Replace with your collection name
            .whereField("id", isEqualTo: id) // Replace with your field name and criteria
            .getDocuments()
        
        let companies = querySnapshot.documents.compactMap { document -> CompanyModel? in
            guard let id = document.documentID as? String,
                  let categories = document["categories"] as? [String] else {
                return nil
            }

            return CompanyModel(id: id, categories: categories)
        }

        return companies[0]
    }
   
    // MARK: Fetch user document
    func fetchUserData(email: String) async throws -> [QueryDocumentSnapshot] {
        let querySnapshot = try await Firestore.firestore()
            .collection("users") // Replace with your collection name
            .whereField("email", isEqualTo: email) // Replace with your field name and criteria
            .getDocuments()

        
        return querySnapshot.documents
    }

    // MARK: Listen to auth state
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            
            if user != nil && user?.email != "" {
                Task.detached {
                    
                    let userDocs = try await self.fetchUserData(email: (user?.email)!)
                
                    let userDoc = userDocs[0].data()
                    print("this is user =>> \(userDoc)")
                    self.currentName = userDoc as? UserModel
                    
                    if let company = userDoc["company"] as? String {
                        // Use the email value here
                        print(company)
                        
                        let companyDoc = try await self.fetchCompany(id: company)
                        let products = try await self.fetchProducts(company: company)
        
                        self.categories = companyDoc.categories
                        self.products = products
                        self.isLoading = true
                        print("companyDoc", companyDoc)
                        print("products with test", products)
                    } else {
                        // Handle the case when the email value is nil
                        print("Email value is nil")
                    }
                    
                    
                    //self.isLoading = false
                    // Handle the result or perform other tasks
                }
            }
            
            self.user = user
        }
    }

    func signUp(
        emailAddress: String,
        password: String
    ) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("an error occured: \(error.localizedDescription)")
                return
            }
        }
    }



    func signIn(
        emailAddress: String,
        password: String
    )  {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { result, error in
            if let x = error {
                let err = x as NSError

                  switch err.code {
                  case AuthErrorCode.wrongPassword.rawValue:
                      print("wrong password, you big dummy")
                      self.authError = err.localizedDescription
                  case AuthErrorCode.invalidEmail.rawValue:
                      print("invalid email - duh")
                      self.authError = err.localizedDescription
                  case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                      print("the account already exists")
                      self.authError = err.localizedDescription
                  default:
                      print("unknown error: \(err.localizedDescription)")
                      self.authError = err.localizedDescription
                  }

               // self.authError = err.localizedDescription

            } else {
                if let _ = result?.user {
                    print("authd")
                } else {
                    print("no authd user")
                }
               // self.authError = ""
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
