//
//  NumberFieldView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

struct NumberFieldView: View {
  var label = "Email or Mobile Number"
  var placeholder = "example@example.com"
  @Binding var value: Date
  var body: some View {
    VStack {
      Text(label)
        .foregroundStyle(.black)
        .font(.custom("LeagueSpartan", size: 20))
        .fontWeight(.medium)
      
      TextField("", value: $value, format: .dateTime, prompt: Text(placeholder).foregroundStyle(Color.fieldText))
        .padding()
        .background(.skinField, in: .rect(cornerRadius: 13))
        .foregroundStyle(Color.fieldText)
    }
  }
}

#Preview {
  NumberFieldView(value: .constant(.now))
}
