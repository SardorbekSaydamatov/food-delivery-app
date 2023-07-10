//
//  FoodCard.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 13/05/23.
//

import SwiftUI

struct FoodCard: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    
    @State var row: Int
    @State var foodName: String
    @State var foodImage: [String]
    @State var foodPrice: Int
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            GeometryReader{geometry in
                
            }
            .frame(width: 220, height: 270)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.top, 70)
            .padding(.leading, row == 0 ? 40 : 10)
            
            VStack{
                AsyncImage(url: URL(string: foodImage[0])){image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2.2)
                        .clipShape(Circle())
                        .position(x: row == 0 ? UIScreen.main.bounds.width / 3 : UIScreen.main.bounds.width / 3.5, y: 100)
                }placeholder: {
                    Color.white
                        .frame(width: UIScreen.main.bounds.width / 2.2)
                        .clipShape(Circle())
                        .position(x: row == 0 ? UIScreen.main.bounds.width / 3 : UIScreen.main.bounds.width / 3.5, y: 100)
                }
                
                Text(foodName.capitalized)
                    .font(.title)
                    .padding(.leading, row == 0 ? 40 : 10)
                
                Text("$\(foodPrice)")
                    .font(.headline)
                    .foregroundColor(Color.red)
                    .padding(.bottom, 60)
                
            }
        }
        .onTapGesture {
            isPresented = true
        }
        .fullScreenCover(isPresented: $isPresented) {
            Details(name: foodName, price: foodPrice, images: foodImage)
        }
    }
}


struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard(row: 0, foodName: "somefoodname", foodImage: ["somefoodimage"], foodPrice: 0)
    }
}
