//
//  ProfileTab.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 12/05/23.
//

import SwiftUI

struct ProfileTab: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        
        ZStack{
            Color.gray.opacity(0.2)
                         .edgesIgnoringSafeArea(.all)
                     
            VStack {
                HStack(spacing: UIScreen.main.bounds.width / 3.2) {
                    Button(action: {
                       
                    }) {
                        Image("arrow")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    
                    Text("Profile")
                        
                        .font(.system(size: 30))
                        .padding(.top)
                        .lineLimit(1)
                    Spacer()
                }
                .position(x: UIScreen.main.bounds.width / 1.8, y: UIScreen.main.bounds.height * 0.1)
                if (authModel.currentName != nil){
                    Text(authModel.currentName!.email)
                }
                
            }
            
        }
        .tabItem {
            Image(systemName: "person")
            
        }
        .tag(2)
    }
}

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
