//
//  FoodDetails.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 14/05/23.
//

import SwiftUI

struct Details: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String
    @State var price: Int
    @State var images: [String]
    @State private var selectedTabIndex = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                TabView(selection: $selectedTabIndex) {
                            ForEach(0..<images.count) { index in
                                AsyncImage(url: URL(string: images[index])) {image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                       
                                }placeholder: {
                                    Color.white
                                        .clipShape(Circle())
                                }
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 2.5)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 10) {
                    ForEach(0..<images.count) { index in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(selectedTabIndex == index ? Color.red : Color.gray)
                    }
                }
                
                Text(name.capitalized)
                    .font(.system(size: 40))
                
                Text("$\(price)")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
                
                VStack(alignment: .leading){
                    
                    Text("Delivery info")
                        .font(.system(size: 25))
                    
                    Text("Delivered between monday aug and \nthursday 20 from 8pm to 09:31 pm")
                        .foregroundColor(Color.gray)
                        .padding(.bottom)
                        .font(.title2)
                    
                    Text("Return policy")
                        .font(.system(size: 25))
                    
                    Text("All our foods are double checked before \nleaving our stores so by any case you \na broken food please contact our \nhotline immideately")
                        .foregroundColor(Color.gray)
                        .padding(.bottom)
                        .font(.title2)
                }
                
                Button {
                    
                } label: {
                    Text("Add to cart")
                        .frame(width: 314, height: 70)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(50)
                        .padding(.bottom, 80)
                }

                    
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.gray.opacity(0.2))
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("arrow")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .foregroundColor(Color.black)
                    }

                }

            }
        }
    }
}

struct FoodDetails_Previews: PreviewProvider {
    static var previews: some View {
        Details(name: "Burger", price: 119, images: ["burger", "lavash"])
    }
}
