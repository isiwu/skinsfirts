//
//  ProfilePasswordManagerView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfilePasswordManagerView: View {
  @Environment(\.dismiss) var dismiss
  @Bindable var pwdManager = ProfilePasswordManagerViewModel()
  var body: some View {
    NavigationStack {
      VStack(spacing: 35) {
        VStack(spacing: 25) {
          PasswordFieldView(label: "Current Password", placeholder: "current password", value: $pwdManager.currentPwd)
          NavigationLink(destination: ResetPasswordView()) {
            Text("Forgot Password?")
              .hspacing(.trailing)
              .underline()
              .foregroundStyle(.skinFirtsBlue)
          }
        }
        PasswordFieldView(label: "New Password", placeholder: "new password", value: $pwdManager.newPwd)
        PasswordFieldView(label: "Confirm Password", placeholder: "confirm password", value: $pwdManager.confirmPwd)
        
        BlueButton(buttonText: "Change Password")
          .vspacing(.bottomTrailing)
          .padding(.bottom, 25)
      }
      .padding(.horizontal)
      .shortNavigationContent("Password Manager", dismiss: dismiss)
    .vspacing(.top)
    }
  }
}

#Preview {
  ProfilePasswordManagerView()
}
