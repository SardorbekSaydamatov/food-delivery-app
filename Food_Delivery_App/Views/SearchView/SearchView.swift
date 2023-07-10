//
//  SearchView.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 22/05/23.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var isSearchTextFocused: Bool
    
    @ObservedObject var authModel: AuthViewModel
    @State var searchText = ""
    @State private var selectedProduct: Product?
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 1),
            GridItem(.flexible(), spacing: 1)
        ]
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return authModel.products ?? [] // Return all products if search text is empty
        } else {
            return authModel.products?.filter { $0.name.localizedCaseInsensitiveContains(searchText) } ?? [] // Filter products based on search text
        }
    }
    
    var body: some View {
        ZStack{
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("arrow")
                }
                
                TextField("", text: $searchText)
                    .focused($isSearchTextFocused)
                    .padding(.leading, UIScreen.main.bounds.width / 10)
            }
            .position(x: UIScreen.main.bounds.width / 1.7, y: UIScreen.main.bounds.height / 8)
            
            GeometryReader{geometry in
                Color.white.opacity(0.4)
                    .frame(height: geometry.size.height / 1.2)
                    .cornerRadius(50)
                
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach(filteredProducts) { product in
                            GeometryReader{ ingeometry in
                                VStack(alignment: .center){
                                    AsyncImage(url: URL(string: product.images[0])){image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(Circle())
                                            .padding(.leading, 25)
                                    }placeholder: {
                                        Color.white
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
                                    }
                                    
                                    VStack(alignment: .center, spacing: 10) {
                                        Text(product.name)
                                            .font(.title)
                                        
                                        Text("$\(product.price)")
                                            .font(.headline)
                                            .foregroundColor(Color.red)
                                    }
                                    .padding(.leading)
                                }
                            }
                            .background(Color.white)
                            .frame(width: 156, height: 212)
                            .cornerRadius(30)
                            .padding(.top, 50)
                            .onTapGesture {
                                selectedProduct = product
                            }
                            .fullScreenCover(item: $selectedProduct) { product in
                                Details(name: product.name, price: product.price, images: product.images)
                            }
                        }
                    }
                    .padding()
                }
                .padding(.bottom, 150)
            }
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 1.5)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.2))
        .onAppear {
            isSearchTextFocused = true 
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(authModel: AuthViewModel())
    }
}
