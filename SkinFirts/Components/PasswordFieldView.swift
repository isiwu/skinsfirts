//
//  PasswordFieldView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct PasswordFieldView: View {
  var label =  "Password"
  var placeholder = "password"
  @State private var showPass = false
  @Binding var value: String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .foregroundStyle(.black)
        .font(.custom("LeagueSpartan", size: 20))
        .fontWeight(.medium)
      
      HStack {
        if showPass {
          TextField("", text: $value, prompt: Text(placeholder).foregroundStyle(Color.fieldText))
            .background(.skinField)
            .foregroundStyle(Color.fieldText)
        } else {
          SecureField("", text: $value, prompt: Text(placeholder).foregroundStyle(Color.fieldText))
            .background(.skinField)
            .foregroundStyle(Color.fieldText)
        }
        
        Button(action: {
          showPass.toggle()
        }) {
          if showPass {
            Image(systemName: "eye")
              .foregroundStyle(.black)
          } else {
            Image(systemName: "eye.slash")
              .foregroundStyle(.black)
          }
        }
      }
      .padding()
      .background(.skinField, in: .rect(cornerRadius: 13))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  PasswordFieldView(value: .constant(""))
}
