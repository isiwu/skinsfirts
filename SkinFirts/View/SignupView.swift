//
//  SignupView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct SignupView: View {
  @Bindable var signupData = SignupViewModel()
  @Environment(\.dismiss) var dismiss
  @State private var showDate = false
  
  var body: some View {
    ScrollView {
      VStack(spacing: 30) {
        VStack(spacing: 15) {
          TextFieldView(label: "Full Name", placeholder: "John Doe", value: $signupData.fullName)
          
          PasswordFieldView(label: "Password", placeholder: "password", value: $signupData.password)
          
          TextFieldView(label: "Email", placeholder: "example@example.com", value: $signupData.email)
          
          TextFieldView(label: "Mobile Number", placeholder: "+123-456-1234", value: $signupData.phone)
          
          VStack {
            Text("Date of birth")
              .foregroundStyle(.black)
              .font(.custom("LeagueSpartan", size: 20))
              .fontWeight(.medium)
              .hspacing(.leading)
            
            Text(signupData.dateOfBirth.format("dd/MM/YYYY"))
              .hspacing(.leading)
              .padding()
              .background(.skinField, in: .rect(cornerRadius: 13))
              .foregroundStyle(Color.fieldText)
              .onTapGesture(perform: {
                showDate = true
              })
              .popover(isPresented: $showDate) {
                DatePicker("", selection: $signupData.dateOfBirth, displayedComponents: [.date])
                  .datePickerStyle(.graphical)
                  .frame(minWidth: 300, maxHeight: 400)
                  .presentationCompactAdaptation(.popover)
                  .onChange(of: signupData.dateOfBirth) { _, _ in
                    showDate = false
                  }
              }
          }
          
          Text("By continuing, you agree to \(Text("Terms of Use").foregroundStyle(.skinFirtsBlue)) and \(Text("Privacy Policy").foregroundStyle(.skinFirtsBlue)).")
            .font(.custom("LeagueSpartan", size: 12))
            .padding(.horizontal, 90)
        }
        
        VStack {
          BlueButton(buttonText: "Sign Up")
            .frame(width: 207)
          
          Text("or sign up with")
            .padding(.vertical)
          
          HStack {
            Image(systemName: "g.circle")
              .font(.system(size: 30))
              .foregroundStyle(.skinFirtsBlue)
              .frame(width: 45, height: 45)
              .background(.skinFirtsGrayBlue, in: .circle)
            
            Image(systemName: "f.circle")
              .font(.system(size: 30))
              .foregroundStyle(.skinFirtsBlue)
              .frame(width: 45, height: 45)
              .background(.skinFirtsGrayBlue, in: .circle)
          }
          
          HStack(spacing: 2) {
            Text("already have an account?")
            
            
            Text("Log In")
              .foregroundStyle(.skinFirtsBlue)
              .onTapGesture(perform: {
                dismiss()
              })
          }
          .padding(.vertical)
          .font(.footnote)
          .fontweight(500)
        }
      }
      .padding(.horizontal)
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        Image("arrowback")
          .onTapGesture(perform: {
            dismiss()
          })
      }
      
      ToolbarItem(placement: .principal) {
        Text("New Account")
          .foregroundStyle(.skinFirtsBlue)
          .font(.custom("LeagueSpartan", size: 24))
          .fontWeight(.semibold)
      }
    })
  }
}

#Preview {
    SignupView()
}
