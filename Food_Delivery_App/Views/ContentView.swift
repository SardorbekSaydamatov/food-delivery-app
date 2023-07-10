//
//  ContentView.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 08/05/23.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
        if authModel.user != nil {
            HomeScreen()
        } else {
            OnboardingView()
        }
        }.onAppear {
            authModel.listenToAuthState()
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
