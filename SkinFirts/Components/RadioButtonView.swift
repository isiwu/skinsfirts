//
//  RadioButtonView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct RadioButtonView: View {
  @Binding var checked: Bool
  
  var body: some View {
    Button(action: {
      self.checked.toggle()
    }) {
      Image(systemName: checked ? "circle.fill" : "circle")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
        .font(.system(size: 30))
        .foregroundColor(Color.skinFirtsBlue)
    }
//    .foregroundColor(Color.white)
  }
}

#Preview {
  RadioButtonView(checked: .constant(false))
}
