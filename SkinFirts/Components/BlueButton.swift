//
//  BlueButton.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct BlueButton: View {
  var buttonText: String = "Log In"
  var action: (() -> Void)?
  var body: some View {
    Button(action: {
      self.action?()
    }) {
      Text(buttonText)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .font(.custom("LeagueSpartan", size: 24))
        .background(.skinFirtsBlue, in: .rect(cornerRadius: 30))
//        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
  }
}

#Preview {
    BlueButton()
}
