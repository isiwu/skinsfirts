//
//  ResetPasswordView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct ResetPasswordView: View {
  @State private var password = ""
  @State private var confirmPass = ""
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack(spacing: 35) {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
          .hspacing(.leading)
        
        VStack(spacing: 15) {
          PasswordFieldView(label: "Password", placeholder: "password", value: $password)
          
          PasswordFieldView(label: "Confirm Password", placeholder: "new password", value: $password)
        }
        
        BlueButton(buttonText: "Create new password")
          .frame(width: 273)
          .padding(.top)
      }
      .vspacing(.top)
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Image("arrowback")
            .onTapGesture(perform: {
              dismiss()
            })
        }
        
        ToolbarItem(placement: .principal) {
          Text("Set Password")
            .foregroundStyle(.skinFirtsBlue)
            .font(.custom("LeagueSpartan", size: 24))
            .fontWeight(.semibold)
        }
      })
    }
  }
}

#Preview {
    ResetPasswordView()
}
