//
//  HomeScreen.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 10/05/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedTab = 0
    
    init() {
           // Set the appearance of the TabView
           UITabBar.appearance().barTintColor = .white
           UITabBar.appearance().isTranslucent = false
       }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1
            HomeTab()
            
            // Tab 2
           FavouritesTab()
            
            // Tab 3
            ProfileTab()
            
            // Tab 4
            
            ActivityTab()
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}


                

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
