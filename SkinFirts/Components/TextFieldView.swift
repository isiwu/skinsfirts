//
//  TextFieldView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct TextFieldView: View {
  var label = "Email or Mobile Number"
  var placeholder = "example@example.com"
  @Binding var value: String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .foregroundStyle(.black)
        .font(.custom("LeagueSpartan", size: 20))
        .fontWeight(.medium)
      
      TextField("", text: $value, prompt: Text(placeholder).foregroundStyle(Color.fieldText))
        .padding()
        .background(.skinField, in: .rect(cornerRadius: 13))
        .foregroundStyle(Color.fieldText)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  TextFieldView(value: .constant(""))
}
