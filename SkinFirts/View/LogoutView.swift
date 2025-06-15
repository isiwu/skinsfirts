//
//  LogoutView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 15/06/2025.
//

import SwiftUI

struct LogoutView: View {
  var body: some View {
    VStack {
      VStack(spacing: 30) {
        Text("Logout")
          .font(.title)
          .fontweight(500)
          .foregroundStyle(.skinFirtsBlue)
        Text("are you sure you want to log out?")
          .font(.title3)
          .fontweight(400)
          .foregroundStyle(.black)
        
        HStack {
          GrayBlueButton(buttonText: "Cancel")
          
          BlueButton(buttonText: "Yes, Logout")
        }
        .padding(.bottom, 40)
      }
      .background(Color.white, in: .rect(cornerRadius: 20))
    }
    .background(Color.skinFirtsBlack.opacity(0.2))
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
    LogoutView()
}
