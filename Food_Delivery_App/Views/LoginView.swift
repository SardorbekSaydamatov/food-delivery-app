//
//  LoginView.swift
//  Food_Delivery_App
//
//  Created by Sardorbek Saydamatov on 08/05/23.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @EnvironmentObject private var authModel: AuthViewModel

    @State var showAlert = false
    @State var selectedTab: Int
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        ZStack {
            GeometryReader{ geometry in
                Color.white
                    .frame(width: geometry.size.width, height: geometry.size.height/2.5)
                    .cornerRadius(30)
                    .ignoresSafeArea()
            }
            VStack{
                HStack(spacing: 80){
                    Button {
                        selectedTab = 1
                    } label: {
                        VStack {
                            Text("Login")
                                .foregroundColor(selectedTab == 1 ? Color.red : Color.black)
                                .font(.headline)

                            Rectangle()
                                .fill(selectedTab == 1 ? Color.red : Color.clear)
                                .frame(width: 134, height: 3)
                                .padding(.top, 9)

                        }
                    }

                    Button {
                        selectedTab = 2
                    } label: {
                        VStack {
                            Text("Sign-up")
                                .foregroundColor(selectedTab == 2 ? Color.red : Color.black)
                                .font(.headline)

                            Rectangle()
                                .fill(selectedTab == 2 ? Color.red : Color.clear)
                                .frame(width: 134, height: 3)
                                .padding(.top, 9)

                        }
                    }
                }
                .padding(.top, selectedTab != 0 ? -110 : -165)

                if selectedTab == 1{
                    VStack(alignment: .leading){
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.horizontal)
                            .autocapitalization(.none)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding([.horizontal, .bottom])
                    }
                } else if selectedTab == 2{
                    VStack(alignment: .leading){
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.horizontal)
                            .autocapitalization(.none)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .padding([.horizontal, .bottom])
                    }
                }


                Button {
                    if selectedTab == 2{
                        authModel.signUp( emailAddress: email, password: password)
                    } else {
                        authModel.signIn( emailAddress: email, password: password)
                    }
                    
                } label: {

                        Text(selectedTab == 2 ? "Sign-up" : "Login")
                            .foregroundColor(Color.black)

                }
                .onChange(of: authModel.authError){error in
                    showAlert = true
                    authModel.authError = nil
                }
                .alert("Wrong email or password! \nPlease try again.", isPresented: $showAlert) {
                            Button("Try", role: .cancel) { }
                        }
            }
        }
        .background(Color.gray.opacity(0.3))
        .navigationBarBackButtonHidden(true)
    }
}




//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(selectedTab: 1)
//    }
//}
