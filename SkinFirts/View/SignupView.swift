//
//  SignupView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct SignupView: View {
  @State private var fullname = ""
  @State private var email = ""
  @State private var password = ""
  @State private var phone = ""
  @State private var dob = Date()
  @State private var dobStr = "DD / MM /YYY"
  @State private var showDate = false
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 30) {
          VStack(spacing: 15) {
            TextFieldView(label: "Full Name", placeholder: "John Doe", value: $fullname)
            
            PasswordFieldView(label: "Password", placeholder: "password", value: $password)
            
            TextFieldView(label: "Email", placeholder: "example@example.com", value: $email)
            
            TextFieldView(label: "Mobile Number", placeholder: "+123-456-1234", value: $password)
            
            VStack {
              Text("Date of birth")
                .foregroundStyle(.black)
                .font(.custom("LeagueSpartan", size: 20))
                .fontWeight(.medium)
                .hspacing(.leading)
              
              Text(dobStr)
                .hspacing(.leading)
                .padding()
                .background(.skinField, in: .rect(cornerRadius: 13))
                .foregroundStyle(Color.fieldText)
                .onTapGesture(perform: {
                  showDate = true
                })
                .popover(isPresented: $showDate) {
                  DatePicker("", selection: $dob, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .frame(minWidth: 300, maxHeight: 400)
                    .presentationCompactAdaptation(.popover)
                    .onChange(of: dob) { _, _ in
                      dobStr = dob.format("dd/MM/YYYY")
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
                .font(.custom("LeagueSpartan", size: 16))
              
          
              NavigationLink(destination: LoginView()) {
                Text("Log In")
                  .foregroundStyle(.skinFirtsBlue)
                  .font(.custom("LeagueSpartan", size: 16))
              }
              .padding(.vertical)
            }
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
}

#Preview {
    SignupView()
}
