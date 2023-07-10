//
//  OnboardingView.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 10/05/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(hex: "#FF4B3A")
                    .ignoresSafeArea(.all)
                
                VStack{
                    NavigationLink(destination: LoginView(selectedTab: 1)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.white)
                                .frame(width: 73, height: 73)
                            Image("logo")
                                .resizable()
                                .frame(width: 40.22, height: 49.65)
                                .padding(.trailing, 20)
                        }
                    }
                    .position(x: 80, y: 50)
                    VStack(alignment: .leading) {
                        Text("Food for")
                        Text("Everyone")
                    }
                    .padding(.bottom, 200)
                    .padding(.trailing, 80)
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .black, design: .rounded))
                    
                    ZStack{
                        Image("toy_face2")
                            .resizable()
                            .frame(width: 225.4, height: 298.54)
                            .position(x: UIScreen.main.bounds.width * 0.737, y: UIScreen.main.bounds.height * 0.05)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, Color(hex: "#FF470B")]),
                                    startPoint: UnitPoint(x: 0.5, y: 0.5),
                                    endPoint: .bottom)
                            )
                        
                        Image("toy_face1")
                            .resizable()
                            .frame(width: 300, height: 400)
                            .position(x: UIScreen.main.bounds.width * 0.35, y: UIScreen.main.bounds.height * 0.01)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(hex: "#FF470B"), .clear]),
                                    startPoint: .bottom,
                                    endPoint: UnitPoint(x: 0.5, y: 0.4))
                            )
                    }
                    
                    NavigationLink(destination: LoginView(selectedTab: 1)) {
                        Text("Get started")
                            .foregroundColor(Color.red)
                            .frame(width: 314, height: 70)
                            .background(Color.white)
                            .cornerRadius(40)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
