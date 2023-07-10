//
//  FavouritesTab.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 12/05/23.
//

import SwiftUI

struct FavouritesTab: View {
    var body: some View {
        ScrollView {
            // Content for Tab 2
        }
        .tabItem {
            Image(systemName: "heart")
            
        }
        .tag(1)
    }
}

struct FavouritesTab_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesTab()
    }
}
