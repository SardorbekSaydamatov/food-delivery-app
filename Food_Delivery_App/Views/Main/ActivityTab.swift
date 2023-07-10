//
//  ActivityTab.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 12/05/23.
//

import SwiftUI

struct ActivityTab: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    var body: some View {
        ScrollView {
            Button {
                authModel.signOut()
            } label: {
                Text("Sign out")
            }

        }
        .tabItem {
            Image(systemName: "clock.arrow.circlepath")
        }
        .tag(3)
    }
}

struct ActivityTab_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTab()
    }
}
