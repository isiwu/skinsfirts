//
//  RegisterView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 70) {
        VStack {
          Image("register-skinfirts")
          VStack(spacing: -16) {
            Text("Skin")
            Text("Firts")
          }
          .foregroundStyle(.skinFirtsBlue)
          .fontWeight(.thin)
          .font(.system(size: 48))
          
          Text("Dermatology center")
            .foregroundStyle(.skinFirtsBlue)
            .fontWeight(.semibold)
            .font(.custom("LeagueSpartan", size: 16, relativeTo: .largeTitle))
        }
        
        VStack(spacing: 40) {
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            .multilineTextAlignment(.center)
            .padding(.horizontal, 52)
          
          VStack {
            BlueButton()
              .frame(width: 207)
            GrayBlueButton(buttonText: "Sign Up")
              .frame(width: 207)
          }
          .padding(.bottom, 30)
        }
      }
    }
  }
}

#Preview {
    WelcomeView()
}
