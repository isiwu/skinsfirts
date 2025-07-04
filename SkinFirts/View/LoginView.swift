//
//  LoginView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  @Environment(\.dismiss) var dismiss
  @AppStorage(UserKey.login.rawValue) private var login = false
  var body: some View {
    NavigationStack {
      VStack(spacing: 50) {
        Text("Welcome")
          .font(.custom("LeagueSpartan", size: 24))
          .fontWeight(.semibold)
          .foregroundStyle(.skinFirtsBlue)
          .hspacing(.leading)
//          .padding(.top)
        
        VStack(spacing: 30) {
          TextFieldView(value: $email)
          
          VStack(spacing: 14) {
            PasswordFieldView(value: $password)
            NavigationLink(destination: ResetPasswordView()) {
              Text("Forget Password")
                .font(.custom("LeagueSpartan", size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.skinFirtsBlue)
                .overlay(content: {
                  Rectangle()
                    .fill(.black)
                    .frame(width: 90, height: 30)
                    .blendMode(.destinationOver)
                })
                .hspacing(.trailing)
            }
          }
        }
        
        VStack {
          BlueButton(buttonText: "Log In", action: loginAction)
            .frame(width: 207)
          
          Text("Or")
            .padding(.vertical)
          
          Image("fingerprint")
            .resizable()
            .frame(width: 45, height: 45)
            .background(.skinFirtsGrayBlue, in: .circle)
          
          HStack(spacing: 2) {
            Text("Don’t have an account?")
            NavigationLink(destination: SignupView()) {
              Text("Sign Up").foregroundStyle(.skinFirtsBlue)
            }
          }
          .font(.custom("LeagueSpartan", size: 12))
          .padding(.vertical)
        }
      }
      .vspacing(.top)
      .padding()
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Image("arrowback")
            .onTapGesture(perform: {
              dismiss()
            })
        }
        
        ToolbarItem(placement: .principal) {
          Text("Hello")
            .foregroundStyle(.skinFirtsBlue)
            .font(.custom("LeagueSpartan", size: 24))
            .fontWeight(.semibold)
        }
      })
      .toolbarTitleDisplayMode(.inline)
      .toolbarBackground(Color.white, for: .navigationBar)
    }
  }
  
  func loginAction() {
    login = true
  }
}

#Preview {
    LoginView()
}
