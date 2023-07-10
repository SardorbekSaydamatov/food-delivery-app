//
//  HomeTab.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 12/05/23.
//

import SwiftUI

struct HomeTab: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State var categories = ["Foods", "Drink", "Snacks", "Sauces", "Desserts"]
    @State var selectedTab = 0
    @State var searchText = ""
    @State var isPresented = false
    @State var searchPressed = false
    @State var products = AuthViewModel().products
    
    var body: some View {
        if !authModel.isLoading{
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
        } else{
            ScrollView {
                HStack(alignment: .center, spacing: 300) {
                    Button {
                        
                    } label: {
                        Image("vector")
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.gray.opacity(0.9))
                    }
                }
                .padding(.top,30)
                .position(x: 0.5 * UIScreen.main.bounds.width, y: 0.01 * UIScreen.main.bounds.height)
                
                Text("Delicious food")
                    .font(.system(size: 35, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.trailing, 80)
                    .position(x: 0.48 * UIScreen.main.bounds.width, y: 0.05 * UIScreen.main.bounds.height)
                
                
                Button(action: {
                    isPresented = true
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black)
                                                        
                        Text("Search")
                            .foregroundColor(.gray)
                           
                    }
                    .frame(width: 314, height: 60)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(50)
                    
                }
                .position(x: 0.45 * UIScreen.main.bounds.width, y: 0.1 * UIScreen.main.bounds.height)
                .fullScreenCover(isPresented: $isPresented) {
                    SearchView(authModel: authModel)
                }

                ScrollView(.horizontal){
                    HStack(spacing: 40) {
                        ForEach(0..<categories.count){index in
                            Button {
                                selectedTab = index
                            } label: {
                                VStack {
                                    Text(categories[index])
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 20))
                                    Rectangle()
                                        .fill(selectedTab == index ? Color.red : Color.clear)
                                        .frame(width: 87, height: 5)
                                        .padding(.bottom, 50)
                                }
                            }
                        }
                    }
                    .padding(.bottom, -70)
                    .padding(.horizontal, 60)
                    .position(x: 0.8 * UIScreen.main.bounds.width, y: 0.1 * UIScreen.main.bounds.height)
                    .padding(.bottom, 120)
                }
                .scrollIndicators(.hidden)
                .padding(.top, 20)
                
                ScrollView(.horizontal){
                    HStack{
                        if let products = authModel.products{
                            if selectedTab == 0{
                                ForEach(0..<products.count) { index in
                                    if products[index].category == "Foods"{
                                        FoodCard(row: index == 0 ? index : 2,foodName: products[index].name, foodImage: products[index].images, foodPrice: products[index].price)
                                    }
                                }
                            } else if selectedTab == 1{
                                ForEach(0..<products.count) { index in
                                    if products[index].category == "Drinks"{
                                        FoodCard(row: index == 0 ? index : 2,foodName: products[index].name, foodImage: products[index].images, foodPrice: products[index].price)
                                    }
                                }
                            } else if selectedTab == 2{
                                ForEach(0..<products.count) { index in
                                    if products[index].category == "Snacks"{
                                        FoodCard(row: index == 0 ? index : 2,foodName: products[index].name, foodImage: products[index].images, foodPrice: products[index].price)
                                    }
                                }
                            } else if selectedTab == 3{
                                ForEach(0..<products.count) { index in
                                    if products[index].category == "Sauces"{
                                        FoodCard(row: index == 0 ? index : 2,foodName: products[index].name, foodImage: products[index].images, foodPrice: products[index].price)
                                    }
                                }
                            } else if selectedTab == 4{
                                ForEach(0..<products.count) { index in
                                    if products[index].category == "Desserts"{
                                        FoodCard(row: index == 0 ? index : 2,foodName: products[index].name, foodImage: products[index].images, foodPrice: products[index].price)                                    }
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .frame(height: UIScreen.main.bounds.height / 5)
                .shadow(radius: 30)
                .padding(.top, 70)
            }
            .tabItem {
                Image(systemName: "house")
                
            }
            .tag(0)
        }
        
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
